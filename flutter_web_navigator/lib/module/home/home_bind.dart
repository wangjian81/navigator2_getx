import 'package:flutter_web_navigator/module/home/home_controller.dart';
import 'package:get/get.dart';

/* HOME */
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

