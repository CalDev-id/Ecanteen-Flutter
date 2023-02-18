part of 'pages.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myBank = [
      ["Bank Mandiri", "IDR 10.000 mins", "assets/mandiri.png"],
      ["Bank BCA", "IDR 10.000 mins", "assets/bca.png"],
      ["Bank BNI", "IDR 10.000 mins", "assets/bni.png"],
    ];

    return GeneralPage(
      backColor: Colors.white,
      title: "Top Up",
      subtitle: "You deserve better meal",
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("e-Wallet",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/border.png"))),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/ical.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("IDR 290.000",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      Text("8008 2208 1996",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                      Text(mockUser.name,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Select Bank",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),
            BankListItem(
              bankName: myBank[0][0],
              bankMin: myBank[0][1],
              bankImage: myBank[0][2],
            ),
            BankListItem(
              bankName: myBank[1][0],
              bankMin: myBank[1][1],
              bankImage: myBank[1][2],
            ),
            BankListItem(
              bankName: myBank[2][0],
              bankMin: myBank[2][1],
              bankImage: myBank[2][2],
            ),
          ],
        ),
      ),
    );
  }
}
