import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/HomePage_top_controller.dart';
import 'package:expensio_v2/widgets/CardWidget1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageTop extends StatelessWidget {
  final BalanceController _controller = Get.put(BalanceController());
  HomePageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: ConfigClass.greyColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      // height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Remaining Balance",
                    style: TextStyle(
                        color: ConfigClass.semiTransparentTextWhite,
                        fontSize: 10,
                        letterSpacing: 0),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => Text(
                        "₹${_controller.balanceAmount.value.toString()}",
                        style: TextStyle(
                            color: ConfigClass.textWhite,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0),
                      ),
                    )),
                // SizedBox(height: 25,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
