import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/MyHomePage_controller.dart';
import 'package:expensio_v2/widgets/CardWidget1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ConfigClass.greyColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.orange,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello Kunal",
                                  style: TextStyle(
                                    color: ConfigClass.textWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16

                                  ),
                                ),
                                Text(
                                  "Welcome Back!",
                                  style:
                                      TextStyle(color: ConfigClass.semiTransparentTextWhite),
                                ),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: ConfigClass.textWhite,
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Balance",
                            style: TextStyle(
                                color: ConfigClass.semiTransparentTextWhite,
                                fontSize: 22,
                                letterSpacing: 0),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "₹14,578",
                            style: TextStyle(
                                color: ConfigClass.textWhite,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0),
                          ),
                        ),
                        // SizedBox(height: 25,),
                      ],
                    ),
                    Row(
                      children: [
                        ContentCard(type: 1, amount: 2502),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        ContentCard(type: 0, amount: 1132),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
