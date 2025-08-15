import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/modules/setting/settings_view.dart';
import 'package:multi_chain_wallet/app/routes/app_pages.dart';
import 'package:multi_chain_wallet/app/theme/app_theme.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: cs.background,
      appBar: AppBar(
        backgroundColor: cs.surface,
        elevation: 0,
        title: Text(
          'Profile',
          style: textTheme.titleLarge?.copyWith(color: cs.onSurface),
        ),
        iconTheme: IconThemeData(color: cs.onSurface),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Obx(
                () => Column(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage(controller.avatar.value),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      controller.name.value,
                      style: textTheme.titleLarge?.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      controller.email.value,
                      style: textTheme.bodyMedium?.copyWith(
                        color: cs.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Card(
                color: cs.surface,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.edit, color: AppColors.primary),
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(color: cs.onSurface),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: cs.onSurface.withOpacity(0.6),
                        size: 18,
                      ),
                      onTap: () {
                        // Get.toNamed(Routes.editProfile);
                      },
                    ),
                    Divider(color: cs.onSurface.withOpacity(0.08), height: 1),
                    ListTile(
                      leading: Icon(Icons.lock, color: AppColors.primary),
                      title: Text(
                        'Security',
                        style: TextStyle(color: cs.onSurface),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: cs.onSurface.withOpacity(0.6),
                        size: 18,
                      ),
                      onTap: () {
                        // Get.toNamed(Routes.security);
                      },
                    ),
                    Divider(color: cs.onSurface.withOpacity(0.08), height: 1),
                    ListTile(
                      leading: Icon(Icons.settings, color: AppColors.primary),
                      title: Text(
                        'Settings',
                        style: TextStyle(color: cs.onSurface),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: cs.onSurface.withOpacity(0.6),
                        size: 18,
                      ),
                      onTap: () => Get.to(() => const SettingsView()),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: controller.onLogout,
                  icon: Icon(Icons.logout, color: AppColors.primary),
                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
