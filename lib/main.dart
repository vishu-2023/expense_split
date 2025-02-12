import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:split_expense/designs/screens/app_bottom_navbar.dart';
import 'package:split_expense/utils/app_colors.dart';

import 'designs/components/lifecycle_manager.dart';
import 'designs/components/unfocus_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UnFocusWrapper(
      child: LifeCycleManager(
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: AppBottomNavbar(),
          theme: ThemeData(
              scaffoldBackgroundColor: surface, appBarTheme: AppBarTheme(backgroundColor: white)),
        ),
      ),
    );
  }
}
