import 'package:expensio_v2/configs/general_configs.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final int type;
  int amount = 0;
  ContentCard({super.key, required this.type, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              if (type == 1)
                CircleAvatar(
                  backgroundColor: ConfigClass.incomeGreenBg,
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: ConfigClass.incomeGreen,
                  ),
                )
              else
                CircleAvatar(
                  backgroundColor: ConfigClass.expenseRedBg,
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    color: ConfigClass.expenseRed,
                  ),
                ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (type == 1)
                    Text(
                      "Income",
                      style: TextStyle(color: ConfigClass.incomeGreen),
                    )
                  else
                    Text("Expense",
                        style: TextStyle(
                          color: ConfigClass.expenseRed,
                        )),
                  Text(
                    "₹${amount.toString()}",
                    style: TextStyle(
                        color: ConfigClass.greyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
