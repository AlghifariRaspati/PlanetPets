import 'package:get/get.dart';

import '../controllers/sign_up_sign_in_controller.dart';

class SignUpSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpSignInController>(
      () => SignUpSignInController(),
    );
  }
}
