import 'package:expensio_v2/Controllers/CustomBottomBarController.dart';
import 'package:expensio_v2/configs/general_configs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingNavigationBar extends StatelessWidget {
  final controller = Get.put(CustomBottomBarController());
  CustomFloatingNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.currentIndex.value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
          decoration: BoxDecoration(
            color: ConfigClass.buttonBackground,
            // gradient: LinearGradient(colors: [ConfigClass.buttonBackground, ConfigClass.textLightGrey]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), spreadRadius: 1, blurRadius: 10)]
          ),
          child: Obx(
            () {
              return BottomNavigationBar(
                onTap: (value) {
                  controller.changeIndex(value);
                },
                currentIndex: controller.currentIndex.value,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.black,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(
                        Icons.home,
                        color: ConfigClass.greyColor,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon:
                          Icon(Icons.add_circle, color: ConfigClass.greyColor),
                      label: "Add"),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.person, color: ConfigClass.greyColor),
                      label: "Profile"),
                ],
              );
            },
          )),
    );
  }
}
