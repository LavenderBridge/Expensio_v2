import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/HomePage_bottom_controller.dart';
import 'package:expensio_v2/controllers/HomePage_top_controller.dart';
import 'package:expensio_v2/pages/home_page/HomePage_top.dart';
import 'package:expensio_v2/widgets/AddNewDialog.dart';
import 'package:expensio_v2/widgets/BottomNavBar.dart';
import 'package:expensio_v2/widgets/CardWidget1.dart';
import 'package:expensio_v2/widgets/CardWidget2.dart';
import 'package:expensio_v2/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final SwipeDismissController _swipeController =
      Get.put(SwipeDismissController());
  final BalanceController _controller = Get.put(BalanceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              primary: true,
              pinned: true,
              elevation: 15,
              shadowColor: Colors.black38,
              backgroundColor: ConfigClass.greyColor,
              expandedHeight: Get.height * 0.3,
              collapsedHeight: Get.height * 0.16,
              forceMaterialTransparency: false,
              title: Row(
                children: [
                  CircleAvatar(child: Image.asset("/images/hero-banner.jpg"),),
                  Text("Welcome back"),
                ],
              ),
              titleTextStyle: TextStyle(fontSize: 12),
              actions: [
                Center(
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: ConfigClass.textWhite,
                      )),
                )
              ],
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(0),
                // title: HomePageTop(),
                title: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: Get.width,
                      // minHeight: Get.height * 0.3
                    ),
                    child: HomePageTop()),
                expandedTitleScale: 2,
                collapseMode: CollapseMode.parallax,
                centerTitle: false,
              ),
            ),
          ];
        },
        body: ListView(children: [
          Container(
            decoration: BoxDecoration(
              color: ConfigClass.greyColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Obx(
                    () => ContentCard(
                        type: 1, amount: _controller.incomeAmount.value),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Obx(
                    () => ContentCard(
                        type: 0, amount: _controller.expenseAmount.value),
                  ),
                ],
              ),
            ),
          ),
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
                itemCount: _swipeController.testdata.length < 10 ? _swipeController.testdata.length : 10,
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
        ]),
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


// SingleChildScrollView(
//         child: Column(
//           children: [
//             HomePageTop(),
//             Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Recent Transactions",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
//                 ),
//                 TextButton(
//                   onPressed: () => Get.toNamed("/second"),
//                   child: Text("View all"),
//                 ),
//               ],
//             ),
//           ),
//           Obx(() {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: _swipeController.testdata.length,
//                 itemBuilder: ((context, index) {
//                   return Dismissible(
//                     key: UniqueKey(),
//                     direction: DismissDirection.horizontal,
//                     onDismissed: (_) {
//                       _swipeController.removeAtIndex(index);
//                     },
//                     child: ContentCardRecentTransactions(
//                       type: _swipeController.testdata[index][1],
//                       amount: _swipeController.testdata[index][2],
//                       title: _swipeController.testdata[index][0],
//                       category: _swipeController.testdata[index][3],
//                       date: DateTime.now().month.toString(),
//                     ),
//                   );
//                 }),
//               ),
//             );
//           }),
//           ],
//         ),
//       ),


// Column(
//         children: [
//           HomePageTop(),
//           Expanded(child: RecentTransactions()),
//         ],
//       ),




