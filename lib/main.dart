import 'package:expensio_v2/configs/routes.dart';
import 'package:expensio_v2/pages/AllTransactionsPage.dart';
import 'package:expensio_v2/pages/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(
    GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/second', page: () => AllTransactions()),
        // GetPage(name: '/third', page: () => Third()),
        // GetPage(name: "/fourth", page: () => Fourth()),
      ],
      home: MyHomePage(),
      // home: AllTransactions(),
    ),
  );
}
