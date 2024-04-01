import 'package:expensio_v2/pages/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final routes = [
  GetPage(name: '/', page: () => MyHomePage()),
  GetPage(name: '/second', page: () => SecondScreen()),
  // GetPage(name: '/third', page: () => ThirdScreen()),
];

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber,);
  }
}