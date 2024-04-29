import 'package:expensio_v2/configs/general_configs.dart';
import 'package:expensio_v2/controllers/MyHomePage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// StylishBottomBar bar = StylishBottomBar(
//   backgroundColor: ConfigClass.greyColor,
//   borderRadius: BorderRadius.circular(2),
//   option: AnimatedBarOptions(
//     // iconSize: 32,
//     barAnimation: BarAnimation.fade,

//     iconStyle: IconStyle.animated,
//   ),
//   items: [
//     BottomBarItem(
//       icon: const Icon(
//         Icons.house_outlined,
//       ),
//       selectedIcon: const Icon(Icons.house_rounded),
//       selectedColor: ConfigClass.textWhite,
//       unSelectedColor: ConfigClass.textLightGrey,
//       backgroundColor: Colors.white,
//       title: const Text('Home'),
//       showBadge: true,
//     ),
//     BottomBarItem(
//       icon: const Icon(Icons.star_border_rounded),
//       selectedIcon: const Icon(Icons.star),
//       // selectedColor: Colors.red,
//       selectedColor: ConfigClass.textWhite,
//       unSelectedColor: ConfigClass.textLightGrey,
//       title: const Text('Star'),
//     ),
//     BottomBarItem(
//         icon: const Icon(
//           Icons.style_outlined,
//         ),
//         selectedIcon: const Icon(
//           Icons.style,
//         ),
//         selectedColor: ConfigClass.textWhite,
//         unSelectedColor: ConfigClass.textLightGrey,
//         title: const Text('Style')),
//     BottomBarItem(
//         icon: const Icon(
//           Icons.person_outline,
//         ),
//         selectedIcon: const Icon(
//           Icons.person,
//         ),
//         selectedColor: ConfigClass.textWhite,
//         unSelectedColor: ConfigClass.textLightGrey,
//         title: const Text('Profile')),
//   ],
//   hasNotch: false,
//   fabLocation: StylishBarFabLocation.center,
// );

NavigationBar bar = NavigationBar(
  selectedIndex: 0,
  onDestinationSelected: (value) {
    CounterController _pageController = Get.put(CounterController());
    _pageController.currentPage.value = value;
  },
  destinations: [
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.list), label: "All Expenses")
  ],
);
