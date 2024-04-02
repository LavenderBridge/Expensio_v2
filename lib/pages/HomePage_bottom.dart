import 'package:expensio_v2/controllers/HomePage_bottom_controller.dart';
import 'package:expensio_v2/controllers/HomePage_top_controller.dart';
// import 'package:expensio_v2/testdata/testdata.dart';
import 'package:expensio_v2/widgets/CardWidget2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class RecentTransactions extends StatelessWidget {
//   RecentTransactions({super.key});

//   final SwipeDismissController _swipeController =
//       Get.put(SwipeDismissController());
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Text(
//               "Recent Transactions",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _swipeController.testdata.length,
//               // physics: ClampingScrollPhysics(),
//               itemBuilder: ((context, index) {
//                 return ContentCardRecentTransactions(
//                     type: _swipeController.testdata[index][1],
//                     amount: _swipeController.testdata[index][2],
//                     title: _swipeController.testdata[index][0],
//                     category: _swipeController.testdata[index][3],
//                     date: DateTime.now().month.toString());
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class RecentTransactions extends StatelessWidget {
  RecentTransactions({Key? key}) : super(key: key);

  final SwipeDismissController _swipeController =
      Get.put(SwipeDismissController());
  final BalanceController _balanceController = Get.put(BalanceController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
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
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _swipeController.testdata.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.startToEnd,
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
              );
            }),
          ),
        ],
      ),
    );
  }
}
