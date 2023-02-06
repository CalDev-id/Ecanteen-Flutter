part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;

  final Function(int index) onTap;

  const CustomBottomNavbar({Key key, this.selectedIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 52,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_home${(selectedIndex == 0) ? '_normal.png' : '.png'}',
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_order${(selectedIndex == 1) ? '_normal.png' : '.png'}',
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_wallet${(selectedIndex == 2) ? '_normal.png' : '.png'}',
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(3);
              }
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/ic_account${(selectedIndex == 3) ? '_normal.png' : '.png'}',
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
