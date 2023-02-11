part of 'pages.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  int selectedIndex = 0;
  List<Transaction> inProgress = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.on_delivery ||
          element.status == TransactionStatus.pending)
      .toList();
  List<Transaction> past = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.delivered ||
          element.status == TransactionStatus.cancelled)
      .toList();

  @override
  Widget build(BuildContext context) {
    if (inProgress.isEmpty && past.length == 0) {
      return GeneralPage(
        title: 'Your Orders',
        subtitle: 'Wait for the best meal',
        child: IllustrationPage(
            buttonTitle1: 'Find Food',
            picturePath: 'assets/history.png',
            subtitle: 'Seems you like have not\nordered any food yet',
            title: 'Your Orders',
            onButtonPressed1: () {
              Get.to(const FoodPage());
            }),
      );
    } else {
      return ListView(
        children: [
          Column(
            children: [
              //header
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Orders',
                      style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Wait for the best meal',
                      style: GoogleFonts.poppins(
                          color: '8D92A3'.toColor(),
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              //body
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(
                      titles: ['In Progress', 'Past Orders'],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: (selectedIndex == 0 ? inProgress : past)
                          .map((e) => Padding(
                                padding: EdgeInsets.only(
                                    bottom: 16,
                                    left: defaultMargin,
                                    right: defaultMargin),
                                child: OrderListItem(
                                  transaction: e,
                                  itemWidth: MediaQuery.of(context).size.width -
                                      2 * defaultMargin,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      );
    }
  }
}
