import 'package:flutter/material.dart';
import 'package:flutter_web_navigator/routes/app_pages.dart';
import 'package:flutter_web_navigator/servier/data_servier.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp.router(
          initialBinding: BindingsBuilder(
            () {
          Get.put(DataService());
        },
      ),
      getPages: AppPages.routes
  ),);
}
