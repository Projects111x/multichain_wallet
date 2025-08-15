import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  var isDark = false.obs;

  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    // Read from storage when controller starts
    isDark.value = _storage.read(_key) ?? false;
    Get.changeThemeMode(themeMode);
  }

  void toggleTheme(bool value) {
    isDark.value = value;
    _storage.write(_key, value); // Save preference
    Get.changeThemeMode(themeMode);
  }
}
