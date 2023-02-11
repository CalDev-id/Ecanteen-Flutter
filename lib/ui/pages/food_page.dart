part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double ListItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // Header
        Container(
          margin: const EdgeInsets.only(
              top: 20, left: defaultMargin, right: defaultMargin),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 35,
                  color: mainColor,
                ),
                Text(
                  "Ecanteen",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: mainColor),
                ),
                Icon(
                  Icons.search,
                  size: 35,
                  color: mainColor,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 300,
              child: Text(
                "Belanja yang banyak ya murid budiman",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor),
                    child: Center(
                      child: Text(
                        "Promo",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor2),
                    child: Center(
                      child: Text(
                        "New",
                        style: GoogleFonts.poppins(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor2),
                    child: Center(
                      child: Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor2),
                    child: Center(
                      child: Text(
                        "Free",
                        style: GoogleFonts.poppins(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        // list of food
        Container(
          padding: const EdgeInsets.only(left: 0),
          height: 240,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: mockFoods
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: defaultMargin),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => FoodDetailsPage(
                                    transaction:
                                        Transaction(food: e, user: mockUser),
                                    onBackButtonPressed: () {
                                      Get.back();
                                    },
                                  ));
                            },
                            child: FoodCard(
                              e,
                              food: e,
                            ),
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
        // list of food tabs
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabBar(
                  titles: const ['New Taste', 'Popular', 'Recommended'],
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  selectedIndex: selectedIndex),
              const SizedBox(
                height: 16,
              ),
              Builder(builder: (_) {
                List<Food> foods = (selectedIndex == 0)
                    ? mockFoods
                    : (selectedIndex == 1)
                        ? []
                        : [];
                return Column(
                    children: foods
                        .map((e) => Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 16),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => FoodDetailsPage(
                                        transaction: Transaction(
                                            food: e, user: mockUser),
                                        onBackButtonPressed: () {
                                          Get.back();
                                        },
                                      ));
                                },
                                child: FoodListItem(
                                    food: e, itemWidth: ListItemWidth),
                              ),
                            ))
                        .toList());
              }),
            ],
          ),
        ),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
