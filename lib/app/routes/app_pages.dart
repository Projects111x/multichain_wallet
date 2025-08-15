// app/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/modules/deposit/deposit_view.dart';
import 'package:multi_chain_wallet/app/modules/setting/settings_view.dart';
import 'package:multi_chain_wallet/app/modules/setting/wallet_management_view.dart';
import 'package:multi_chain_wallet/app/modules/root/root_binding.dart';
import 'package:multi_chain_wallet/app/modules/root/root_view.dart';
import 'package:multi_chain_wallet/app/modules/withdraw/withdraw_view.dart';
import '../modules/startup/startup_binding.dart';
import '../modules/startup/startup_view.dart';

abstract class Routes {
  static const startup = '/startup';
  static const root = '/root';
  static const deposit = '/deposit';
  static const withdraw = '/withdraw';
  static const walletManagement = '/wallet-management';
  static const settings = '/settings';
}

class AppPages {
  static const initial = Routes.startup;

  static final routes = [
    GetPage(
      name: Routes.startup,
      page: () => const StartupView(),
      binding: StartupBinding(),
    ),
    GetPage(
      name: Routes.root,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(name: Routes.deposit, page: () => const DepositView()),
    GetPage(name: Routes.withdraw, page: () => const WithdrawView()),
    GetPage(
      name: Routes.walletManagement,
      page: () => const WalletManagementView(),
    ),
    GetPage(name: Routes.settings, page: () => const SettingsView()),
  ];
}
