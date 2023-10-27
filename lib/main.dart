import 'package:agri_tech/bindings/login_screen_binding.dart';
import 'package:agri_tech/routes/app_pages.dart';
import 'package:agri_tech/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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


//const Color(0xff004040),

