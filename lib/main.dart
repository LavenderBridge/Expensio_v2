import 'package:expensio_v2/configs/routes.dart';
import 'package:expensio_v2/pages/AllTransactionsPage.dart';
import 'package:expensio_v2/pages/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      // routes: routes,
      // home: MyHomePage(),
      home: AllTransactions(),
    ),
  );
}
