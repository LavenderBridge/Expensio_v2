// import 'package:expensio_v2/configs/general_configs.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class SupabaseFunctions extends GetxController {
//   var transactionList = RxList<Map<String, dynamic>>();

//   //create
//   Future<void> createData(String title, String category, double amount,
//       bool is_income, String? description, DateTime timestamp) async {
//     await Supabase.instance.client.from('expenses').insert({
//       'title': title,
//       'category': category,
//       'amount': amount,
//       'is_income': is_income,
//       'description': description,
//       'timestamp': timestamp
//     }).then((value) {
//       return Get.snackbar(
//           'Success',
//           'User signed in',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: ConfigClass.incomeGreen,
//           colorText: Colors.white,
//           borderRadius: 0,
//           margin: EdgeInsets.all(0),
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           snackStyle: SnackStyle.GROUNDED,
//           maxWidth: Get.width,
//           forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
//           reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
//         );
//     });
//   }

//   //read
//   Future<void> readData() async {
//     transactionList.value =
//         await Supabase.instance.client.from('expenses').select();
//     print(transactionList);
//   }

//   //delete
//   Future<void> deleteData(int index) async {
//     var id = transactionList[index]['id'];
//     await Supabase.instance.client.from('expenses').delete().eq('id', id).then((value) {
//       return Get.snackbar(
//           'Success',
//           'User signed in',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: ConfigClass.incomeGreen,
//           colorText: Colors.white,
//           borderRadius: 0,
//           margin: EdgeInsets.all(0),
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           snackStyle: SnackStyle.GROUNDED,
//           maxWidth: Get.width,
//           forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
//           reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
//         );
//     });
//   }
// }
