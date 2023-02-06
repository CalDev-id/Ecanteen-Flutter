part of 'pages.dart';

class FoodDetailsPage extends StatefulWidget {
  final Transaction transaction;
  final Function onBackButtonPressed;

  const FoodDetailsPage({Key key, this.transaction, this.onBackButtonPressed})
      : super(key: key);

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(child: Container(color: Colors.white)),
        ],
      ),
    );
  }
}
