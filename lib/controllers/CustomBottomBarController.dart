import 'package:get/get.dart';

class CustomBottomBarController extends GetxController{
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
    print(currentIndex.value);
  }
}