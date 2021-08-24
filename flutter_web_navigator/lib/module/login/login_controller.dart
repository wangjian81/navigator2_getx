import 'package:flutter/cupertino.dart';
import 'package:flutter_web_navigator/servier/storge.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final textcontroller = TextEditingController();

  gotoHome() {
    Get.rootDelegate.offNamed('/home');
  }

  void save() {
    Storage().saveUser(textcontroller.text).then((result) {
      if (result == true) {
        print('保存成功');
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    Storage().getUser().then((result) {
      textcontroller.text = result;
    });
  }
}
