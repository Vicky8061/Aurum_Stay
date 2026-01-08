import 'package:get/get.dart';

class BottomNavController extends GetxController {
  /// current tab index
  var currentIndex = 0.obs;

  void changeTab(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }
}
