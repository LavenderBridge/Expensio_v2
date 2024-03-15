import 'package:expensio_v2/testdata/testdata.dart';
import 'package:expensio_v2/widgets/CardWidget2.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Recent Transactions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: testData.length,
              // physics: ClampingScrollPhysics(),
              itemBuilder: ((context, index)
              {
                return ContentCardRecentTransactions(
                    type: testData[index][1],
                    amount: testData[index][2],
                    title: testData[index][0],
                    category: testData[index][3],
                    date: DateTime.now().month.toString());
              }),
            ),
          ),
        ],
      ),
    );
  }
}
