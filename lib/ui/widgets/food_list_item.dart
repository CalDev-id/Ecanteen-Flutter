part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  const FoodListItem({Key key, this.food, this.itemWidth}) : super(key: key);

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
                image: AssetImage(food.picturePath),
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
                  food.name,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  NumberFormat.currency(
                          symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                      .format(food.price),
                  style: GoogleFonts.poppins(fontSize: 13),
                )
              ],
            ),
          ),
          Rating(rate: food.rate)
        ],
      ),
    );
  }
}
