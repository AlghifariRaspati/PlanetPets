import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Intro/views/intro_view.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/bindings/sign_up_sign_in_binding.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/views/sign_up_sign_in_view.dart';
import 'package:planet_pets_app/auth_service.dart';

import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/verify_email.dart';
import 'package:planet_pets_app/widgets/sign_in.dart';
import 'package:planet_pets_app/widgets/sign_up.dart';
import 'package:planet_pets_app/widgets/utils.dart';

import 'package:provider/provider.dart';
import 'app/modules/home/views/navbar.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        getPages: AppPages.routes,
        home: AuthChecker(),
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: Utils.messengerKey,
      ),
    );
  });
}

final navigatorKey = GlobalKey<NavigatorState>();
