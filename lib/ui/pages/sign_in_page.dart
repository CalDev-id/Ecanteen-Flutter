part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isLoading = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/foodlogo3.png',
                    width: 120,
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      "Welcome Back, Foodlovers!",
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "Email Address",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelStyle: GoogleFonts.poppins()),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot Password",
                                  style: GoogleFonts.poppins(color: mainColor),
                                )
                              ]),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelStyle: GoogleFonts.poppins()),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: isLoading
                              // ignore: dead_code
                              ? SpinKitFadingCircle(
                                  size: 45,
                                  color: mainColor,
                                )
                              : FloatingActionButton(
                                  backgroundColor: mainColor,
                                  onPressed: () {
                                    Get.to(() => const MainPage());
                                  },
                                  child: const Icon(Icons.arrow_forward)),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create New Account?",
                        style: GoogleFonts.poppins(color: greyColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignUpPage());
                        },
                        child: Text(
                          "  Sign Up",
                          style: GoogleFonts.poppins(color: mainColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
