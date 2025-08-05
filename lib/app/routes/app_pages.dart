import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/modules/details/details_binding.dart';
import 'package:multi_chain_wallet/app/modules/details/details_view.dart';
import 'package:multi_chain_wallet/app/modules/home/home_binding.dart';
import 'package:multi_chain_wallet/app/modules/home/home_view.dart';
import 'package:multi_chain_wallet/app/modules/root/root_binding.dart';
import 'package:multi_chain_wallet/app/modules/root/root_view.dart';
import '../modules/startup/startup_binding.dart';
import '../modules/startup/startup_view.dart';

class AppPages {
  static const initial = '/startup';
  static final routes = [
    GetPage(
      name: '/startup',
      page: () => const StartupView(),
      binding: StartupBinding(),
    ),
    GetPage(
      name: '/root',
      page: () => const RootView(),
      binding: RootBinding(),
    ),
  ];
}
