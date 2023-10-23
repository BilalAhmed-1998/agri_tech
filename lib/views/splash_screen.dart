import 'package:agri_tech/views/login_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: _buildSplashBody(context),
        nextScreen: const LoginScreen(),
        splashIconSize: Get.height,
        duration: 1000,
        disableNavigation: false,
        backgroundColor: const Color(0xff16072D));
  }

  Widget _buildSplashBody(BuildContext context) {
    return Scaffold(
        body: Container());
  }
}
