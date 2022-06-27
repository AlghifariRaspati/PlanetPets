import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/widgets/utils.dart';

import 'package:planet_pets_app/wrapper.dart';

import 'app/routes/app_pages.dart';

import 'package:flutter/services.dart';

import 'wrapper.dart';

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
        home: Wrapper(),
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: Utils.messengerKey,
      ),
    );
  });
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static final String title = "Firebase Auth";

  @override
  Widget build(BuildContext context) => MaterialApp();
}
