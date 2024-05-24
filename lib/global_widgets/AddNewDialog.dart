import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/Firestore_controller.dart';
import 'package:expensio_v2/testdata/testdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewDialog extends StatelessWidget {
  AddNewDialog({super.key});

  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  var dropDownValue;
  FirestoreController storageController = Get.put(FirestoreController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SimpleDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        elevation: 10,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        title: Center(child: const Text('Add new expense')),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Title",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color.fromARGB(65, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter title here",
                    hintStyle: TextStyle(
                        color: ConfigClass.textLightGrey.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Amount",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color.fromARGB(65, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter amount here",
                    hintStyle: TextStyle(
                        color: ConfigClass.textLightGrey.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Color.fromARGB(65, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("Food"),
                      value: "Food",
                    ),
                    DropdownMenuItem(
                      child: Text("Transport"),
                      value: "Transport",
                    ),
                  ],
                  onChanged: (value) => {
                    dropDownValue = value
                  },
                )),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: ConfigClass.expenseRedBg,
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: ConfigClass.incomeGreenBg,
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "title" : _titleController.text,
                          "amount" : _amountController.text,
                          "category": dropDownValue
                        };
                        storageController.addData(data);
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
