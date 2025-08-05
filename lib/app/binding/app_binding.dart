import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/modules/details/details_controller.dart';
import 'package:multi_chain_wallet/app/modules/home/home_controller.dart';
import 'package:multi_chain_wallet/app/modules/profile/profile_controller.dart';
import 'package:multi_chain_wallet/app/modules/root/root_controller.dart';
import '../modules/startup/startup_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartupController>(() => StartupController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DetailsController>(() => DetailsController(), fenix: true);
    Get.lazyPut<RootController>(() => RootController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
