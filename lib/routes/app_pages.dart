import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/login_screen_binding.dart';
import '../views/login_screen.dart';
import '../views/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.LOGIN_SCREEN,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
    ),
  ];
}
