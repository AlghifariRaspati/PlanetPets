import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/auth_service.dart';
import 'package:planet_pets_app/widgets/utils.dart';
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
