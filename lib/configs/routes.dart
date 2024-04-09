import 'package:expensio_v2/pages/all_transactions/AllTransactionsPage.dart';
import 'package:expensio_v2/pages/home_page/MyHomePage.dart';
import 'package:expensio_v2/pages/login_page/LoginPage.dart';
import 'package:expensio_v2/pages/login_page/NewRegistrationPage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> GetPages = [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(name: '/second', page: () => const AllTransactions()),
        GetPage(name: '/register', page: () => NewRegistrationPage())
        // GetPage(name: '/third', page: () => Third()),
        // GetPage(name: "/fourth", page: () => Fourth()),
      ];