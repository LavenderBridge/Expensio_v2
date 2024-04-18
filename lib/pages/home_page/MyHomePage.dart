import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/HomePage_bottom_controller.dart';
import 'package:expensio_v2/pages/home_page/HomePage_top.dart';
import 'package:expensio_v2/widgets/AddNewDialog.dart';
import 'package:expensio_v2/widgets/BottomNavBar.dart';
import 'package:expensio_v2/widgets/CardWidget2.dart';
import 'package:expensio_v2/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final SwipeDismissController _swipeController =
      Get.put(SwipeDismissController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePageTop(),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                TextButton(
                  onPressed: () => Get.toNamed("/second"),
                  child: Text("View all"),
                ),
              ],
            ),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _swipeController.testdata.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                    onDismissed: (_) {
                      _swipeController.removeAtIndex(index);
                    },
                    child: ContentCardRecentTransactions(
                      type: _swipeController.testdata[index][1],
                      amount: _swipeController.testdata[index][2],
                      title: _swipeController.testdata[index][0],
                      category: _swipeController.testdata[index][3],
                      date: DateTime.now().month.toString(),
                    ),
                  );
                }),
              ),
            );
          }),
          ],
        ),
      ),
      


      bottomNavigationBar: bar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: ((context) => AddNewDialog()),
        ),
        backgroundColor: ConfigClass.incomeGreenBg,
        elevation: 5,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}



// Column(
//         children: [
//           HomePageTop(),
//           Expanded(child: RecentTransactions()),
//         ],
//       ),




