import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/theme/app_theme.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Obx(
              () => Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(controller.avatar.value),
                  ),
                  SizedBox(height: 18),
                  Text(
                    controller.name.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    controller.email.value,
                    style: TextStyle(color: AppColors.gray, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36),
            // گزینه‌ها (مثال: Edit, Security, Settings, ... )
            Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit, color: AppColors.primary),
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.gray,
                      size: 18,
                    ),
                    onTap: () {}, // TODO: رفتن به صفحه ویرایش
                  ),
                  Divider(color: Colors.white12, height: 1),
                  ListTile(
                    leading: Icon(Icons.lock, color: AppColors.primary),
                    title: Text(
                      'Security',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.gray,
                      size: 18,
                    ),
                    onTap: () {}, // TODO: امنیت
                  ),
                  Divider(color: Colors.white12, height: 1),
                  ListTile(
                    leading: Icon(Icons.settings, color: AppColors.primary),
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.gray,
                      size: 18,
                    ),
                    onTap: () {}, // TODO: تنظیمات
                  ),
                ],
              ),
            ),
            Spacer(),
            // دکمه خروج
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.primary),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: controller.onLogout,
                icon: Icon(Icons.logout, color: AppColors.primary),
                label: Text(
                  "Logout",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
