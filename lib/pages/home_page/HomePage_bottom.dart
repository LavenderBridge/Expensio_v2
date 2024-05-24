import 'package:expensio_v2/controllers/HomePage_bottom_controller.dart';
import 'package:expensio_v2/global_widgets/CardWidget2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePageBottom extends StatelessWidget {
  HomePageBottom({Key? key}) : super(key: key);

  final SwipeDismissController _swipeController =
      Get.put(SwipeDismissController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Recent Transactions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _swipeController.testdata.length < 5
                    ? _swipeController.testdata.length
                    : 5,
                itemBuilder: ((context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                    background: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
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
