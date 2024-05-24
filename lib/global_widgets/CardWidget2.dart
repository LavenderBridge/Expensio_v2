import 'package:expensio_v2/configs/general_configs.dart';
import 'package:flutter/material.dart';

class ContentCardRecentTransactions extends StatelessWidget {
  final int type; //income = 1, expense = other
  final int amount;
  final String title;
  final String category;
  final String date;
  ContentCardRecentTransactions(
      {super.key,
      required this.type,
      required this.amount,
      required this.title,
      required this.category,
      required this.date
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 70,
          minHeight: 50
        ),
        child: Container(
          height: 70,
          // width: MediaQuery.of(context).size.width,
          // width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 2,
                  color: Color.fromARGB(12, 0, 0, 0)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(children: [
                    if (type == 1)
                      CircleAvatar(
                        backgroundColor: ConfigClass.incomeGreenBg,
                        child: Icon(
                          Icons.arrow_upward_rounded,
                          color: ConfigClass.incomeGreen,
                        ),
                      )
                    else if (type == 0)
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
                        Text(
                          title,
                          style: TextStyle(
                              color: ConfigClass.greyColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          category,
                          style: TextStyle(
                              color: ConfigClass.textLightGrey, fontSize: 10),
                        )
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type == 1 ? "+₹${amount.toString()}" : "-₹${amount.toString()}",
                        style: TextStyle(
                            color: ConfigClass.greyColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        date.toString(),
                        style:
                            TextStyle(color: ConfigClass.textLightGrey, fontSize: 10),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
