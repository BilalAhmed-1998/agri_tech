import 'package:agri_tech/controllers/courses_screen_controller.dart';
import 'package:get/get.dart';

class CoursesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesScreenController>(() => CoursesScreenController());
  }
}
