import 'package:agri_tech/views/home_screen.dart';
import 'package:agri_tech/views/login_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: _buildSplashBody(context),
        nextScreen: FirebaseAuth.instance.currentUser != null
            ? const HomeScreen()
            : const LoginScreen(),
        splashIconSize: Get.height,
        duration: 10,
        disableNavigation: false,
        backgroundColor: Colors.green.shade900);
  }

  Widget _buildSplashBody(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff004040),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
