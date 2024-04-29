import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/MyHomePage_controller.dart';
import 'package:expensio_v2/pages/add_new_page/AddNewItemPage.dart';
import 'package:expensio_v2/pages/all_transactions/AllTransactionsPage.dart';
import 'package:expensio_v2/pages/home_page/HomePage_bottom.dart';
import 'package:expensio_v2/pages/home_page/HomePage_top.dart';
import 'package:expensio_v2/widgets/AddNewDialog.dart';
import 'package:expensio_v2/widgets/BottomNavBar.dart';
import 'package:expensio_v2/widgets/CardWidget1.dart';
import 'package:expensio_v2/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget displayScreen = landingPage();
  CounterController _pageController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: NavDrawer(),
      body: [landingPage(), AddNewItemPage(), AllTransactions()][_pageController.currentPage.value],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _pageController.currentPage.value,
        onDestinationSelected: (value) {
          setState(() {
            _pageController.currentPage.value = value;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.add), label: "Add"),
          NavigationDestination(icon: Icon(Icons.list), label: "All Expenses")
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() {
      //     _pageController.currentPage.value = 2;
      //   }),
      //   backgroundColor: ConfigClass.incomeGreenBg,
      //   elevation: 5,
      //   shape: CircleBorder(),
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}

class landingPage extends StatelessWidget {
  const landingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageTop(),
        Expanded(child: RecentTransactions()),
      ],
    );
  }
}
