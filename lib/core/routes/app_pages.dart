import 'package:get/get.dart';
import 'package:split_expense/core/providers/auth_providers.dart';
import 'package:split_expense/core/repositories/auth_repositories.dart';
import 'package:split_expense/designs/screens/main_view.dart';
import 'package:split_expense/designs/screens/startup/login_controller.dart';
import 'package:split_expense/designs/screens/startup/login_view.dart';
import 'package:split_expense/designs/screens/startup/signup_view.dart';
import 'package:split_expense/designs/screens/startup/signup_view_controller.dart';
import 'package:split_expense/designs/screens/tabs/home/split/create_split_controller.dart';
import 'package:split_expense/designs/screens/tabs/home/split/create_split_view.dart';

part 'app_routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> appPages = [...onlineRoutes, ...offlineRoutes];
  static List<GetPage<dynamic>> get offlineRoutes => [];
  static List<GetPage<dynamic>> get onlineRoutes {
    return [
      GetPage(
          name: _Paths.CREATESPLIT,
          page: () => const CreateSplitView(),
          binding: BindingsBuilder(
              () => Get.lazyPut<CreateSplitController>(() => CreateSplitController()))),
      GetPage(
          name: _Paths.LOGIN,
          page: () => LoginView(),
          binding: BindingsBuilder(() => Get.lazyPut<LoginController>(() => LoginController()))),
      GetPage(
          name: _Paths.SIGN_UP,
          page: () => SignupView(),
          binding: BindingsBuilder(
              () => Get.lazyPut<SignupViewController>(() => SignupViewController()))),
      GetPage(
        name: _Paths.MAIN,
        page: () => AppBottomNavbar(),
      ),
    ];
  }
}

class BindingX {
  static BindingsBuilder intialBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<AuthProviders>(() => AuthProviders());
      Get.lazyPut<AuthRepositories>(() => AuthRepositories());
    });
  }
}
