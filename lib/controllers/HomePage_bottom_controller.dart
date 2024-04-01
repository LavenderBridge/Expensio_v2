import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/HomePage_top_controller.dart';
import 'package:expensio_v2/testdata/testdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SwipeDismissController extends GetxController {
  final BalanceController _balanceController = Get.put(BalanceController());
  var testdata = testData.obs;

  void removeAtIndex(int index) {
    bool undo = false;
    var item = testData.elementAt(index);
    testdata.removeAt(index);
    if (item[1] == 1) {
      _balanceController.incomeAmount -= item[2];
      _balanceController.balanceAmount -= item[2];
    } else {
      _balanceController.expenseAmount -= item[2];
      _balanceController.balanceAmount += item[2];
    }
    Get.snackbar('Item Dismissed', 'Item ${testData[index][0]} dismissed',
        // snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        isDismissible: true,
        backgroundColor: Colors.white70,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.horizontal,
        mainButton: TextButton(
            onPressed: () {
              if (!undo) {
                testdata.insert(index, item);
                undo = true;
                if (item[1] == 1) {
                  _balanceController.incomeAmount += item[2];
                  _balanceController.balanceAmount += item[2];
                } else {
                  _balanceController.expenseAmount += item[2];
                  _balanceController.balanceAmount -= item[2];
                }
              }
              return;
            },
            child: Icon(Icons.refresh)));
  }
}
