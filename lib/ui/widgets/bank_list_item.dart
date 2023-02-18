part of 'widgets.dart';

class BankListItem extends StatelessWidget {
  final String bankName;
  final String bankImage;
  final String bankMin;

  const BankListItem({Key key, this.bankImage, this.bankMin, this.bankName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.black12,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 80,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bankImage), fit: BoxFit.contain)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bankName,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: '#14193F'.toColor())),
              Text(bankMin,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87)),
            ],
          ),
          // Spacer(),
          // Container(
          //   width: 24,
          //   height: 24,
          //   margin: EdgeInsets.only(right: 6),
          //   child: Icon(Icons.chevron_right, color: Colors.grey),
          // ),
        ],
      ),
    );
  }
}
