import 'package:agri_tech/bindings/course_screen_binding.dart';
import 'package:agri_tech/bindings/home_screen_binding.dart';
import 'package:agri_tech/bindings/sign_up_screen_binding.dart';
import 'package:agri_tech/views/courses_screen.dart';
import 'package:agri_tech/views/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/login_screen_binding.dart';
import '../views/login_screen.dart';
import '../views/sign_up_screen.dart';
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
    GetPage(
      name: AppRoutes.SIGN_UP_SCREEN,
      page: () => const SignUpScreen(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME_SCREEN,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.COURSES_SCREEN,
      page: () => const CoursesScreen(),
      binding: CoursesScreenBinding(),
    ),
  ];
}
