import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_chain_wallet/app/binding/app_binding.dart';
import 'app/theme/app_theme.dart';
import 'app/theme/theme_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final themeCtrl = Get.put(ThemeController());
  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeCtrl.themeMode,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        initialBinding: AppBinding(),
      ),
    ),
  );
}
