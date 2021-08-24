import 'package:get/get.dart';
import 'package:flutter_web_navigator/module/test/test1_controller.dart';

class DataService extends GetxService {
  static DataService get to => Get.find();

  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  bool isChange = false;

  List<DemoProduct> products = [];


  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
