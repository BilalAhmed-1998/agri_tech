import 'package:agri_tech/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool obscured = true.obs;
  String emailText = "";

  void onPressSignUpButton() => Get.toNamed(AppRoutes.SIGN_UP_SCREEN);

  void onPressSignInButton() async {
    AuthService().customSnackBarMessenger('Signing In...');
    await AuthService()
        .signInWithEmailPassword(emailController.text, passwordController.text);
    if (FirebaseAuth.instance.currentUser != null) {
      Get.toNamed(AppRoutes.HOME_SCREEN);
    }
  }

  void onPressForgotPasswordButton() async {
    emailText = emailController.text;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailText);

    if (emailText != "" && emailValid) {
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailText);
      // if (!mounted) return;
      if (list.isNotEmpty) {
        try {
          FirebaseAuth.instance
              .sendPasswordResetEmail(email: emailController.text);
          Get.snackbar(
            'Success',
            'A link has been sent to your email successfully!"',
            margin: const EdgeInsets.only(bottom: 25),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } on Exception catch (e) {
          Get.snackbar(
            'Something went wrong!',
            margin: const EdgeInsets.only(bottom: 25),
            e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Something went wrong!',
          margin: const EdgeInsets.only(bottom: 25),
          'User not found!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Something went wrong!',
        margin: const EdgeInsets.only(bottom: 25),
        'Email Field is empty/invalid!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
