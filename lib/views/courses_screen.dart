import 'package:agri_tech/controllers/courses_screen_controller.dart';
import 'package:agri_tech/views/course_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/card_courses.dart';
import '../components/header_inner.dart';
import '../utils/const.dart';

class CoursesScreen extends GetView<CoursesScreenController> {
  static const String routeName = '/coursesScreen';

  const CoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding),
                height: 44,
                width: 44,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(0),
                    child: const Icon(Icons.keyboard_backspace,
                        color: Colors.white),
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //       horizontal: Constants.mainPadding,
              //       vertical: Constants.mainPadding),
              //   height: 44,
              //   width: 44,
              //   child: InkWell(
              //     onTap: () {
              //
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: Colors.white.withOpacity(0.3),
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       padding: const EdgeInsets.all(0),
              //       child: const Icon(Icons.menu, color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(50.0)),
              color: Constants.mainThemeColor,
            ),
          ),
          Positioned(
            top: 0,
              child: Image.asset(
                'assets/images/course_cover.png',
                height: 300,
                fit: BoxFit.cover,
              )),
          ListView(
            children: <Widget>[
              SizedBox(height: Constants.mainPadding * 6.5),
              Container(
                height: Get.height,
                padding: EdgeInsets.fromLTRB(
                    Constants.mainPadding,
                    Constants.mainPadding * 2,
                    Constants.mainPadding,
                    Constants.mainPadding),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(50.0)),
                    color: Colors.green.shade50),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Text(
                        'LEVELS',
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(const CourseDetailScreen()),
                      child: CardCourses(
                        image: Image.asset("assets/images/icon_1.png",
                            width: 40, height: 40),
                        color: Constants.lightPink,
                        title: "Level 0",
                        hours: "10 hours, 19 lessons",
                        progress: "",
                        percentage: 0.25,
                      ),
                    ),
                    CardCourses(
                      image: Image.asset("assets/images/icon_2.png",
                          width: 40, height: 40),
                      color: Constants.lightYellow,
                      title: "Level 1",
                      hours: "13 hours, 16 lessons",
                      progress: "",
                      percentage: 0.65,
                    ),
                    CardCourses(
                      image: Image.asset("assets/images/icon_3.png",
                          width: 40, height: 40),
                      color: Constants.lightViolet,
                      title: "Level 3",
                      hours: "15 hours, 12 lessons",
                      progress: "",
                      percentage: 0.86,
                    ),
                    CardCourses(
                      image: Image.asset("assets/images/icon_4.png",
                          width: 40, height: 40),
                      color: Colors.blue.shade50,
                      title: "Level 4",
                      hours: "12 hours, 10 lessons",
                      progress: "",
                      percentage: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
