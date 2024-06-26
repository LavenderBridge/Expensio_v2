import 'package:expensio_v2/controllers/HomePage_bottom_controller.dart';
import 'package:expensio_v2/controllers/HomePage_top_controller.dart';
import 'package:expensio_v2/widgets/CardWidget2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AllTransactionsBottom extends StatelessWidget {
  AllTransactionsBottom({super.key});

  final SwipeDismissController _swipeController = Get.put(SwipeDismissController());
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
            child: Text(
              "All Transactions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _swipeController.testdata.length,
                itemBuilder: ((context, index) {
                  return ContentCardRecentTransactions(
                    type: _swipeController.testdata[index][1],
                    amount: _swipeController.testdata[index][2],
                    title: _swipeController.testdata[index][0],
                    category: _swipeController.testdata[index][3],
                    date: DateTime.now().month.toString(),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
    ;
  }
}
