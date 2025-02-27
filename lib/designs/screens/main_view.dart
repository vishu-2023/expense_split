import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:split_expense/designs/components/select_images.dart';
import 'package:split_expense/designs/screens/tabs/analytics/analytics_view.dart';
import 'package:split_expense/designs/screens/tabs/history/history_view.dart';
import 'package:split_expense/designs/screens/tabs/home/home_controller.dart';
import 'package:split_expense/designs/screens/tabs/home/home_view.dart';
import 'package:split_expense/designs/screens/tabs/profile/profile_view.dart';
import 'package:split_expense/designs/screens/tabs/scanner/scanner_view.dart';
import 'package:split_expense/utils/app_assets.dart';
import 'package:split_expense/utils/app_colors.dart';

class AppBottomNavbar extends StatefulWidget {
  const AppBottomNavbar({super.key});

  @override
  State<AppBottomNavbar> createState() => _AppBottomNavbarState();
}

class _AppBottomNavbarState extends State<AppBottomNavbar> {
  @override
  void initState() {
    super.initState();
    Get.put<HomeController>(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: views(),
      items: navbarItems(),
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style15,
    );
  }
}

List<Widget> views() {
  return [HomeView(), HistoryView(), ScannerView(), AnalyticsView(), ProfileView()];
}

List<PersistentBottomNavBarItem> navbarItems() {
  return [
    PersistentBottomNavBarItem(
        icon: selectIcon(AppNavBarIcons.homeFilled),
        inactiveIcon: selectIcon(AppNavBarIcons.homeOutlined, color: iconColor)),
    PersistentBottomNavBarItem(
        icon: selectIcon(AppNavBarIcons.historyFilled),
        inactiveIcon: selectIcon(AppNavBarIcons.historyOutlined, color: iconColor)),
    PersistentBottomNavBarItem(
        icon: selectIcon(AppNavBarIcons.scanner, color: white), activeColorPrimary: black),
    PersistentBottomNavBarItem(
        icon: selectIcon(AppNavBarIcons.analyticsFilled),
        inactiveIcon: selectIcon(AppNavBarIcons.analyticsOutlined, color: iconColor)),
    PersistentBottomNavBarItem(
        icon: selectIcon(AppNavBarIcons.profileFilled),
        inactiveIcon: selectIcon(AppNavBarIcons.proifileOutlined, color: iconColor))
  ];
}
