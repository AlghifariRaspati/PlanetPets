import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Intro/views/intro_view.dart';

import 'app/routes/app_pages.dart';

import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        getPages: AppPages.routes,
        home: IntroView(),
      ),
    );
  });
}
