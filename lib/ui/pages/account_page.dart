part of 'pages.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int selectedIndex = 0;
  List<String> accountMenus = [
    "Edit Profile",
    "Security",
    "Payments",
    "Sign Out"
  ];
  List<String> aboutMenus = [
    "Rate App",
    "Help Center",
    "Privacy & Policy",
    "Terms & Conditions"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                  width: 110,
                  height: 110,
                  margin: const EdgeInsets.only(bottom: 20),
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
              Text(mockUser.name, style: GoogleFonts.poppins(fontSize: 18)),
              Text(mockUser.email,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTabBar(
            titles: const ["Account", "About"],
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        (selectedIndex == 0)
            ? Column(
                children: accountMenus
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey)
                            ],
                          ),
                        ))
                    .toList(),
              )
            : Column(
                children: aboutMenus
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey)
                            ],
                          ),
                        ))
                    .toList(),
              )
      ],
    );
  }
}
