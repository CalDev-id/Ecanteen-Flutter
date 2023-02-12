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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300])),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
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
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Text(bankMin,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87)),
            ],
          ),
          Spacer(),
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: 6),
            child: Icon(Icons.chevron_right, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
