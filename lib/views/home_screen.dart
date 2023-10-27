import 'package:agri_tech/components/custom_drawer.dart';
import 'package:agri_tech/components/dashboard_page.dart';
import 'package:agri_tech/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class HomeScreen extends GetView<HomeScreenController> {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeScreenController());
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: const CustomDrawer(),
        backgroundColor: const Color(0xffDDDDDD),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () =>
                        controller.scaffoldKey.currentState?.openDrawer(),
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.transparent,
                      child: SvgPicture.asset(
                        'assets/images/menu_icon.svg',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await AuthService().signOut(context);
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  )
                ],
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: const Color(0xff004040),
        ),
        body: const DashboardPage(),
      ),
    );
  }
}
