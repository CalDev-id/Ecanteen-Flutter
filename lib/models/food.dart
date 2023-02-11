part of 'models.dart';

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  const Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
  });

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  const Food(
    id: 1,
    picturePath: 'assets/pizza2.jpg',
    name: 'Pizza Bandung',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur',
    ingredients: "Seledri, Telur, Tepung, Blueberry, Keju",
    price: 30000,
    rate: 4.8,
  ),
  const Food(
    id: 2,
    picturePath: 'assets/mixuemerah.jpeg',
    name: 'Mixue Merah',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur',
    ingredients: "Seledri, Telur, Tepung, Blueberry, Keju",
    price: 15000,
    rate: 4.8,
  ),
  const Food(
    id: 3,
    picturePath: 'assets/coffee.jpg',
    name: 'Nigeria Coffee',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur',
    ingredients: "Seledri, Telur, Tepung, Blueberry, Keju",
    price: 30000,
    rate: 4.8,
  ),
];
