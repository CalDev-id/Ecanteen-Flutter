part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard(Food mockFood, {Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
              blurRadius: 15, spreadRadius: 3, color: Colors.black12)
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                    image: AssetImage(food.picturePath), fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            width: 200,
            child: Text(food.name,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Rating(rate: food.rate),
          )
        ],
      ),
    );
  }
}
