import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString name = 'Alex Johnson'.obs;
  final RxString email = 'alex.johnson@email.com'.obs;
  final RxString avatar = 'assets/images/profile.jpg'.obs;

  void onLogout() {
    Get.offAllNamed('/startup');
  }
}
