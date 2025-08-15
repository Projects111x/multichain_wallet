import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/modules/profile/profile_view.dart';
import '../../theme/app_theme.dart';
import '../home/home_view.dart';
import '../details/details_view.dart';
import 'root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  // Keep pages constant; they’ll rebuild only when index changes
  final List<Widget> _pages = const [HomeView(), DetailsView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Obx(
      () => Scaffold(
        backgroundColor: cs.background,
        body: _pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: cs.surface,
          selectedItemColor: cs.primary,
          unselectedItemColor: cs.onSurface.withOpacity(0.6),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onBottomNavTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sync_alt_rounded),
              label: 'Trading',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
