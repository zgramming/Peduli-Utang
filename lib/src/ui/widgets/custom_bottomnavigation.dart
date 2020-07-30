import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../providers/global_statenotifier_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gNavItem = [
      GButton(
        icon: Icons.home,
        text: 'Beranda',
      ),
      GButton(
        icon: Icons.search,
        text: 'Cari',
      ),
      GButton(
        icon: Icons.account_circle,
        text: 'Akun',
      ),
    ];

    return Consumer((ctx, read) {
      final globalState = read(globalStateNotifierProvider.state);

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              color: colorPallete.black.withOpacity(.5),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: globalState.isDarkMode ? colorPallete.darkGreyAccent2 : colorPallete.white,
        ),
        child: GNav(
          gap: 2,
          activeColor: Colors.white,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          duration: kThemeAnimationDuration,
          tabBackgroundColor: colorPallete.primaryColor,
          tabs: gNavItem,
          selectedIndex: globalState.indexBottomNavigation,
          onTabChange: (index) =>
              globalStateNotifierProvider.read(context).setCurrentIndexBottomNavigation(index),
        ),
      );
    });
  }
}
