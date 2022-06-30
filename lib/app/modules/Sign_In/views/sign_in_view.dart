import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/views/sign_up_sign_in_view.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/widgets/sign_in.dart';

import '../controllers/sign_in_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColor.mainColor,
                ));
              } else if (snapshot.hasData) {
                return NavBar();
              } else if (snapshot.hasError) {
                return Center(
                    child: Text("Something Went Wrong",
                        style: TextStyle(color: Colors.red)));
              } else {
                return SignUpSignInView();
              }
            }),
      );
}
