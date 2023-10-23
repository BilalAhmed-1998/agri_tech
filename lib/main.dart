import 'package:agri_tech/bindings/login_screen_binding.dart';
import 'package:agri_tech/routes/app_pages.dart';
import 'package:agri_tech/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AgriTech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Inter'),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
      initialBinding: LoginScreenBinding(),
      defaultTransition: Transition.cupertino,
    );
  }
}
