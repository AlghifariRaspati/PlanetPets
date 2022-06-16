// TODO Implement this library.import 'package:get/get.dart';
import 'package:get/get.dart';

import 'package:planet_pets_app/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
