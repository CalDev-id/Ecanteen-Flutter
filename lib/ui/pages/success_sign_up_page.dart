part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IllustrationPage(
      buttonTitle1: 'Find Foods',
      picturePath: 'assets/signup.png',
      subtitle: 'Now you are able to order \nsome foods as a self-reward',
      title: 'Yeay! Completed',
      onButtonPressed1: () {
        Get.offAll(const MainPage());
      },
    ));
  }
}
