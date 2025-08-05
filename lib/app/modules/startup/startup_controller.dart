import 'package:get/get.dart';

class StartupController extends GetxController {
  void onGetStarted() {
    Get.offAllNamed('/root');
  }
}
