import 'package:get/get.dart';

import '../modules/Intro/bindings/intro_binding.dart';
import '../modules/Intro/views/intro_view.dart';
import '../modules/Options/bindings/options_binding.dart';
import '../modules/Options/views/options_view.dart';
import '../modules/SignUp_SignIn/bindings/sign_up_sign_in_binding.dart';
import '../modules/SignUp_SignIn/views/sign_up_sign_in_view.dart';
import '../modules/Sign_In/bindings/sign_in_binding.dart';
import '../modules/Sign_In/views/sign_in_view.dart';
import '../modules/Sign_Up/bindings/sign_up_binding.dart';
import '../modules/Sign_Up/views/sign_up_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SIGN_IN,
      page: () => SignUpSignInView(),
      binding: SignUpSignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.OPTIONS,
      page: () => OptionsView(),
      binding: OptionsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
