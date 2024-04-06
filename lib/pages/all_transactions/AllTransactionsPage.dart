
import 'package:expensio_v2/pages/all_transactions/AllTransactions_bottom.dart';
import 'package:expensio_v2/pages/all_transactions/AllTransactions_top.dart';
import 'package:flutter/material.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
              children: [
                AllTransactionsTop(),
                Expanded(child: AllTransactionsBottom()),
              ],
            ),
      ),
    );
  }
}