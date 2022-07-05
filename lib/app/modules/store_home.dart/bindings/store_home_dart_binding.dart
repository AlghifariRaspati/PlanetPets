import 'package:get/get.dart';

import '../controllers/store_home_dart_controller.dart';

class StoreHomeDartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreHomeDartController>(
      () => StoreHomeDartController(),
    );
  }
}
