part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File imageFile;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(imagePicked.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController pass2Controller = TextEditingController();

    handleSubmit() async {
      final email = emailController.value.text;
      final password = passwordController.value.text;
      final cPassword = pass2Controller.value.text;

      await AuthServices().signUp(email, password, cPassword);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeneralPage(
          title: "Sign Up",
          subtitle: "Create new account",
          onBackButtonPressed: () {
            Get.back();
          },
          backColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await getImage();
                  },
                  child: Container(
                      width: 110,
                      height: 110,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/border.png"))),
                      child: imageFile != null
                          ? Container(
                              // margin: const EdgeInsets.only(top: 30),
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(imageFile),
                                      fit: BoxFit.cover)),
                            )
                          : Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/photodummy.png"),
                                    fit: BoxFit.cover),
                              ),
                            )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: GoogleFonts.poppins()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: GoogleFonts.poppins()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: GoogleFonts.poppins()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: pass2Controller,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: GoogleFonts.poppins()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: FloatingActionButton(
                      backgroundColor: mainColor,
                      onPressed: () => handleSubmit(),
                      child: const Icon(Icons.arrow_forward)),
                )
              ],
            ),
          )),
    );
  }
}
