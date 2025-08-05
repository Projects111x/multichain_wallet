import 'package:get/get.dart';

class RootController extends GetxController {
  var selectedIndex = 0.obs;

  void onBottomNavTap(int index) {
    selectedIndex.value = index;
  }
}
