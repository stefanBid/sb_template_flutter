import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Project - Helpers
import '../../helpers/theme/app_colors.dart';

// Project - Models
import '../../models/app_route.dart';

// Project - Widgets
import 'app_bar_element.dart';
import 'bottom_bar_element.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    super.key,
    required this.navigationShell,
    required this.tabs,
  });

  final StatefulNavigationShell navigationShell;
  final List<AppRoute> tabs;

  @override
  Widget build(BuildContext context) {
    final currentTab = tabs[navigationShell.currentIndex];

    return Scaffold(
      backgroundColor: AppColors.of(context).background,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBarElement(title: currentTab.screenTitle ?? currentTab.label),
      body: GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            SafeArea(bottom: false, child: navigationShell),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomBarElement(
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => navigationShell.goBranch(index),
                tabs: tabs,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
