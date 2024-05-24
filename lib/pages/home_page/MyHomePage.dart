import 'package:expensio_v2/Controllers/CustomBottomBarController.dart';
import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/MyHomePage_controller.dart';
import 'package:expensio_v2/global_widgets/CustomFloatingNavigationBar.dart';
import 'package:expensio_v2/pages/add_new_page/AddNewItemPage.dart';
import 'package:expensio_v2/pages/all_transactions/AllTransactionsPage.dart';
import 'package:expensio_v2/pages/home_page/HomePage_bottom.dart';
import 'package:expensio_v2/pages/home_page/HomePage_top.dart';
import 'package:expensio_v2/global_widgets/AddNewDialog.dart';
import 'package:expensio_v2/global_widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget displayScreen = const landingPage();
  // final PageIndexController _pageIndexController =
  //     Get.put(PageIndexController());
  final CustomBottomBarController _currentPageIndexController = Get.put(CustomBottomBarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: NavDrawer(),
      body: Obx(
        () => [
          const landingPage(),
          AddNewItemPage(),
          const AllTransactions()
        ][_currentPageIndexController.currentIndex.value],
      ),
      bottomNavigationBar: CustomFloatingNavigationBar(),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => setState(() {
        //   _pageController.currentPage.value = 2;
        // }),
        onPressed: () =>
            showDialog(context: context, builder: (_) => AddNewDialog()),
        backgroundColor: ConfigClass.incomeGreenBg,
        elevation: 5,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
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
        Expanded(child: HomePageBottom()),
      ],
    );
  }
}
