import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/sign_in_button.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreen extends GetView<LoginScreenController> {
  static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: width,
                height: 300,
                child: SvgPicture.asset(
                  'assets/images/login_aesthetics.svg',
                ),
              ),
              const SizedBox(
                height: 40,
                child: Text(
                  'Please fill the input below',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xffA1A1A1),
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
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
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 22,
                        color: Colors.grey.withOpacity(0.5),
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
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.withOpacity(0.7),
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              ///Password field///
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Obx(
                  () => TextField(
                    obscureText: controller.obscured.value,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          size: 22,
                          color: Colors.grey.withOpacity(0.5),
                        ),
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
                        hintText: 'Enter password',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.withOpacity(0.7),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: controller.onPressForgotPasswordButton,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff004040),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                  enableFeedback: true,
                  onTap: controller.onPressSignInButton,
                  child: SignInButton(
                    width: width,
                    height: 56,
                    text: 'Sign In',
                  )),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: controller.onPressSignUpButton,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff004040),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
