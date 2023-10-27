import 'package:agri_tech/components/in_app_web_component.dart';
import 'package:agri_tech/routes/app_routes.dart';
import 'package:agri_tech/views/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'dashboard_page.dart';
import 'my_drawer_header.dart';

enum DrawerSections {
  dashboard,
  simulations,
  events,
  courses,
  notes,
  settings,
  notifications,
  privacyPolicy,
  sendFeedback,
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const DashboardPage();
    } else if (currentPage == DrawerSections.courses) {
      container = const CoursesScreen();
    }
    //else if (currentPage == DrawerSections.events) {
    //   container = EventsPage();
    // } else if (currentPage == DrawerSections.notes) {
    //   container = NotesPage();
    // } else if (currentPage == DrawerSections.settings) {
    //   container = SettingsPage();
    // } else if (currentPage == DrawerSections.notifications) {
    //   container = NotificationsPage();
    // } else if (currentPage == DrawerSections.privacy_policy) {
    //   container = PrivacyPolicyPage();
    // } else if (currentPage == DrawerSections.send_feedback) {
    //   container = SendFeedbackPage();
    // }
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderDrawer(),
            myDrawerList(),
          ],
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Simulations", Icons.video_camera_back_outlined,
              currentPage == DrawerSections.simulations ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Courses", Icons.bookmark_add_sharp,
              currentPage == DrawerSections.courses ? true : false),
          menuItem(5, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(6, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(7, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(8, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacyPolicy ? true : false),
          menuItem(9, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.sendFeedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.simulations;
              Get.to(const InAppWebComponent());
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.courses;
              Get.offAndToNamed(AppRoutes.COURSES_SCREEN);
            } else if (id == 5) {
              currentPage = DrawerSections.notes;
            } else if (id == 6) {
              currentPage = DrawerSections.settings;
            } else if (id == 7) {
              currentPage = DrawerSections.notifications;
            } else if (id == 8) {
              currentPage = DrawerSections.privacyPolicy;
            } else if (id == 9) {
              currentPage = DrawerSections.sendFeedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
