part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
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
                Container(
                    width: 110,
                    height: 110,
                    margin: const EdgeInsets.only(bottom: 26),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/border.png"))),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/ical.jpg"),
                            fit: BoxFit.cover),
                      ),
                    )),
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
                    controller: passwordController,
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
                      onPressed: () {
                        Get.to(() => const AddressPage());
                      },
                      child: const Icon(Icons.arrow_forward)),
                )
              ],
            ),
          )),
    );
  }
}
