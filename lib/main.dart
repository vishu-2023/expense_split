import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:split_expense/core/routes/app_pages.dart';
import 'package:split_expense/core/services/sf_services.dart';
import 'package:split_expense/utils/app_colors.dart';

import 'designs/components/lifecycle_manager.dart';
import 'designs/components/unfocus_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SFServices.initialize();
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
          getPages: AppPages.appPages,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.LOGIN,
          initialBinding: BindingX.intialBindings(),
          theme: ThemeData(
              scaffoldBackgroundColor: surface, appBarTheme: AppBarTheme(backgroundColor: white)),
        ),
      ),
    );
  }
}
