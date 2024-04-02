import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/HomePage_top_controller.dart';
import 'package:expensio_v2/testdata/testdata.dart';
import 'package:expensio_v2/widgets/CardWidget1.dart';
import 'package:expensio_v2/widgets/LineChart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTransactionsTop extends StatelessWidget {
  const AllTransactionsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
                        Text(
                          "Transactions",
                          style: TextStyle(
                              color: ConfigClass.greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: ConfigClass.greyColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Income",
                              style: TextStyle(
                                color: ConfigClass.semiTransparentTextWhite,
                                fontSize: 11
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: ConfigClass.buttonBackground,
                              borderRadius: BorderRadius.circular(4)),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                  color: ConfigClass.greyColor,
                                  fontSize: 11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 2.2,
              child: AllTransactionsGraph(dataList: lineChartData),
            ),
          ],
        ),
      ),
    );
  }
}
