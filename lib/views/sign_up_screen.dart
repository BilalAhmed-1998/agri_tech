import 'package:agri_tech/controllers/sign_up_screen_controller.dart';
import 'package:agri_tech/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/loading_card.dart';
import '../components/sign_in_button.dart';
import '../services/auth_service.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  static const String routeName = '/signUpScreen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                height: 250,
                child: Image.asset(
                  'assets/images/logo3.png',
                  fit: BoxFit.fill,
                ),
              ),

              ///name field///
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      fillColor: Colors.transparent,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color(0xff004040), width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.withOpacity(0.7),
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              ///email field///
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      fillColor: Colors.transparent,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color(0xff004040), width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      hintText: 'Enter Email Address',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.withOpacity(0.7),
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              ///password field///
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.obscured.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscured.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: Colors.grey.shade700,
                          ),
                          onPressed: () {
                            controller.obscured.value =
                                !controller.obscured.value;
                          },
                        ),
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        fillColor: Colors.transparent,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color(0xff004040), width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.withOpacity(0.7),
                        )),
                  ),
                ),
              ),

              ///password Confirmation field///
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Obx(
                  () => TextField(
                    controller: controller.confirmPasswordController,
                    obscureText: controller.obscured.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscured.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: Colors.grey.shade700,
                          ),
                          onPressed: () {
                            controller.obscured.value =
                                !controller.obscured.value;
                          },
                        ),
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        fillColor: Colors.transparent,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color(0xff004040), width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.withOpacity(0.7),
                        )),
                  ),
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              InkWell(
                  enableFeedback: true,
                  onTap: () async {
                    signingUpProtocol(context);
                  },
                  child: SignInButton(
                    width: width,
                    height: 56,
                    text: 'Sign Up',
                  )),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: Get.back,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff004040),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signingUpProtocol(BuildContext context) async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(controller.emailController.text);
    bool passValid =
        RegExp("^.{8,}\$").hasMatch(controller.passwordController.text);

    if (emailValid &&
        passValid &&
        controller.nameController.text.isNotEmpty &&
        FirebaseAuth.instance.currentUser == null) {
      AuthService().customSnackBarMessenger('Signing Up...');
      await AuthService().signUpWithEmailPassword(
          context,
          controller.emailController.text,
          controller.passwordController.text,
          controller.nameController.text);
      if (context.mounted) {
        if (FirebaseAuth.instance.currentUser != null) {
          showDialog(
              context: context,
              builder: (BuildContext context) => LoadingCard(
                    text: "Creating New User",
                  ));
          Get.back();
          // if (!context.mounted) return;
          //await FireStoreDatabase.createNewUser(context);
          if (!context.mounted) return;
          Get.offAndToNamed(AppRoutes.HOME_SCREEN);
        }
      }
    } else if (controller.passwordController.text !=
        controller.confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Your password is not matching!')));
    } else if (controller.nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your name!')));
    } else {
      (!emailValid)
          ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please enter a valid email.'),
            ))
          : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please enter min 8 digit password!'),
            ));
    }
  }
}
