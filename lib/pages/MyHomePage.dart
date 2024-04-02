import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/MyHomePage_controller.dart';
import 'package:expensio_v2/pages/HomePage_bottom.dart';
import 'package:expensio_v2/pages/HomePage_top.dart';
import 'package:expensio_v2/widgets/BottomNavBar.dart';
import 'package:expensio_v2/widgets/CardWidget1.dart';
import 'package:expensio_v2/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// class MyHomePage extends StatelessWidget {
//   String title = "no_data";
//   final CounterController _controller = Get.put(CounterController());
//   MyHomePage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: Obx(
//           () => Text(
//             "Current Counter Value: ${_controller.count.value}",
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _controller.increase(),
//           child: Text("Increment Value"),
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        endDrawer: NavDrawer(),
        body: Column(
          children: [
            HomePageTop(),
            Expanded(child: RecentTransactions()),
          ],
        ),
        bottomNavigationBar: bar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ConfigClass.incomeGreenBg,
        elevation: 5,
        shape: CircleBorder(),
        child: Icon(
          Icons.add
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
