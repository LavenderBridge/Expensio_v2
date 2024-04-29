import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/AddNewItemPage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewItemPage extends StatefulWidget {
  AddNewItemPage({super.key});

  @override
  State<AddNewItemPage> createState() => _AddNewItemPageState();
}

class _AddNewItemPageState extends State<AddNewItemPage> {
  int selected = 1;

  AddItemController _controller = Get.put(AddItemController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Record",
                style: TextStyle(
                    color: ConfigClass.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: selected == 1 ? Colors.black : ConfigClass.buttonBackground,
                      borderRadius: BorderRadius.circular(
                        (4),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _controller.expenseType.value=1;
                          print (_controller.expenseType.value);
                        });
                      },
                      child: Text(
                        "Income",
                        style: TextStyle(color: selected == 1 ? ConfigClass.semiTransparentTextWhite : ConfigClass.textLightGrey),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: selected == 0 ? Colors.black : ConfigClass.buttonBackground,
                      borderRadius: BorderRadius.circular(
                        (4),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _controller.expenseType.value=0;
                          print (_controller.expenseType.value);
                        });
                      },
                      child: Text(
                        "Expense",
                        style: TextStyle(
                            color: selected == 0 ? ConfigClass.semiTransparentTextWhite : ConfigClass.textLightGrey),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
