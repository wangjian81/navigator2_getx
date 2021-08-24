import 'package:get/get.dart';
import 'package:flutter_web_navigator/routes/app_pages.dart';
import 'package:flutter_web_navigator/servier/data_servier.dart';

class Test1Controller extends GetxController {
  gotoDetails(String id) {
    Get.rootDelegate.offNamed(Routes.prodoucDetails(id));
  }

  final products = <DemoProduct>[].obs;

  void loadDemoProductsFromSomeWhere() {
    products.add(
      DemoProduct(
        name: 'Product added on: ${DateTime.now().toString()}',
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      ),
    );
    DataService.to.products = products;
  }

  @override
  void onInit() {
    super.onInit();
    products.value = DataService.to.products;
  }

  @override
  void onReady() {
    loadDemoProductsFromSomeWhere();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class DemoProduct {
  final String name;
  final String id;

  DemoProduct({
    required this.name,
    required this.id,
  });
}
