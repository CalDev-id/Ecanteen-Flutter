part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
            child: Container(
          color: 'FAFAFC'.toColor(),
        )),
        SafeArea(
            child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Center(child: FoodPage()),
            const Center(child: OrderHistory()),
            const Center(child: WalletPage()),
            const Center(child: AccountPage()),
          ],
        )),
        Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ))
      ],
    ));
  }
}
