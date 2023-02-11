part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  const OrderListItem({Key key, this.transaction, this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(transaction.food.picturePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: itemWidth - 182, // 60 + 12 + 110
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.food.name,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "${transaction.quantity} item • ${NumberFormat.currency(symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID').format(transaction.total)}",
                  style: GoogleFonts.poppins(fontSize: 13),
                )
              ],
            ),
          ),
          SizedBox(
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(convertDateTime(transaction.dateTime),
                    style: GoogleFonts.poppins(fontSize: 12, color: greyColor)),
                (transaction.status == TransactionStatus.cancelled)
                    ? Text(
                        'Cancelled',
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: Colors.red),
                      )
                    : (transaction.status == TransactionStatus.pending)
                        ? Text(
                            'Pending',
                            style: GoogleFonts.poppins(
                                fontSize: 10, color: Colors.red),
                          )
                        : (transaction.status == TransactionStatus.on_delivery)
                            ? Text(
                                'On Delivery',
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: mainColor),
                              )
                            : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
    }

    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
