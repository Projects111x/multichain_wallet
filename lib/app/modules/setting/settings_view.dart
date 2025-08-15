import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/theme/theme_controller.dart';
import 'wallet_management_view.dart';
import 'qr_scanner_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final themeCtrl = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: textTheme.titleLarge?.copyWith(color: cs.onSurface),
        ),
        backgroundColor: cs.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: cs.onSurface),
      ),
      body: ListView(
        children: [
          // Section: Wallet
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Wallet',
              style: textTheme.titleMedium?.copyWith(color: cs.onSurface),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: cs.onSurface),
            title: const Text('Wallet Management'),
            onTap: () => Get.to(() => const WalletManagementView()),
          ),
          const Divider(height: 1),

          // Section: Tools
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Tools',
              style: textTheme.titleMedium?.copyWith(color: cs.onSurface),
            ),
          ),
          ListTile(
            leading: Icon(Icons.qr_code_scanner, color: cs.onSurface),
            title: const Text('Scan QR Code'),
            onTap: () => Get.to(() => const QRScannerView()),
          ),
          ListTile(
            leading: Icon(Icons.vpn_lock, color: cs.onSurface),
            title: const Text('Inner VPN'),
            trailing: Icon(
              Icons.chevron_right,
              color: cs.onSurface.withOpacity(0.6),
            ),
            onTap: _showVpnDialog,
          ),
          const Divider(height: 1),

          // Section: Appearance
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Appearance',
              style: textTheme.titleMedium?.copyWith(color: cs.onSurface),
            ),
          ),
          Obx(() {
            final isDark = themeCtrl.isDark.value;
            return SwitchListTile(
              secondary: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: isDark ? Colors.amber : cs.primary,
              ),
              title: Text(isDark ? 'Dark Theme' : 'Light Theme'),
              value: isDark,
              activeColor: cs.primary,
              onChanged: themeCtrl.toggleTheme,
            );
          }),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  void _showVpnDialog() {
    final cs = Get.theme.colorScheme;
    final textTheme = Get.textTheme;

    Get.defaultDialog(
      title: "Enable VPN",
      titleStyle: textTheme.titleMedium?.copyWith(
        color: cs.onSurface,
        fontWeight: FontWeight.bold,
      ),
      middleText: "Do you want to enable Inner VPN?",
      middleTextStyle: textTheme.bodyMedium?.copyWith(color: cs.onSurface),
      textCancel: "Cancel",
      textConfirm: "Enable",
      confirmTextColor: Colors.white,
      buttonColor: cs.primary,
      onConfirm: () {
        Get.back();
        Get.snackbar(
          "VPN",
          "Inner VPN activated successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: cs.surface,
          colorText: cs.onSurface,
        );
      },
    );
  }
}
