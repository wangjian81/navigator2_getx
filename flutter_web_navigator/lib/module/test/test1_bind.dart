import 'package:get/get.dart';
import 'package:flutter_web_navigator/module/test/test1_controller.dart';


class Test1Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(Test1Controller());
  }
}

