part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IllustrationPage(
      buttonTitle1: 'Order Other Foods',
      buttonTitle2: 'View My Order',
      picturePath: 'assets/order.png',
      subtitle: 'You’ve Made Order\nPlease wait for the best meal',
      title: 'You’ve Made Order',
      onButtonPressed1: () {
        Get.offAll(const MainPage());
      },
      onButtonPressed2: () {
        Get.offAll(const MainPage());
      },
    ));
  }
}
