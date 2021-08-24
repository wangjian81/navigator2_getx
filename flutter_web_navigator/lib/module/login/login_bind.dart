
/* LOGIN */
import 'package:flutter_web_navigator/module/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
