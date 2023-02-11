import 'package:flutter/material.dart';
import 'ui/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
      // home: FoodDetailsPage(
      //   transaction: Transaction(food: mockFoods[0], user: mockUser),
      // ),
    );
  }
}
