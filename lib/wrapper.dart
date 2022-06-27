import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/bindings/sign_up_sign_in_binding.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/views/sign_up_sign_in_view.dart';
import 'package:planet_pets_app/app/modules/Sign_In/views/sign_in_view.dart';
import 'package:planet_pets_app/app/modules/home/views/home_view.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';

import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/verify_email.dart';

import 'app/modules/Intro/views/intro_view.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColor.mainColor,
          ));
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Something Went Wrong",
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (snapshot.hasData) {
          return VerifyEmail();
        } else {
          return IntroView();
        }
      });
  // signInWithGoogle() async {
  //   final GoogleSignInAccount? googleuser =
  //       await GoogleSignIn(scopes: <String>["email"]).signIn();

  //       final Goo
  // }
}
