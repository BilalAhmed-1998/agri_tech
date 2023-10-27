import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in with email password//
  Future signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Something went wrong!',
        margin: const EdgeInsets.only(bottom: 25),
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

//Sign up with email password//
  Future signUpWithEmailPassword(
      context, String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.message ?? '',
        style: const TextStyle(color: Colors.white),
      )));
    }
  }

//Sign out //

  Future signOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.message ?? '',
        style: const TextStyle(color: Colors.white),
      )));
    }
  }

  void customSnackBarMessenger(String text) {
    // Get.showSnackbar(GetSnackBar(
    //     backgroundColor: Colors.grey.shade300,
    //     duration: const Duration(seconds: 1),
    //     content: Row(
    //       children: [
    //         const SizedBox(
    //           width: 20,
    //         ),
    //         const CircularProgressIndicator.adaptive(
    //           backgroundColor: Color(0xff004040),
    //         ),
    //         const SizedBox(
    //           width: 20,
    //         ),
    //         Text(
    //           text,
    //           style: const TextStyle(
    //             color: Colors.black,
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ],
    //     )));
    //
    Get.defaultDialog(
        title: '',
        backgroundColor: Colors.grey.shade300,
        content: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            const CircularProgressIndicator.adaptive(
              backgroundColor: Color(0xff004040),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
