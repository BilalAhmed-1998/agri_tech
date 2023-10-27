import 'package:agri_tech/controllers/sign_up_screen_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpScreenController>(() => SignUpScreenController());
  }
}
