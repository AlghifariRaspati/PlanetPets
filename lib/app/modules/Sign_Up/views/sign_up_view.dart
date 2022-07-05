import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/verify_email.dart';
import 'package:planet_pets_app/widgets/sign_up.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

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
                return const SignUp();
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text("Something Went Wrong",
                        style: TextStyle(color: Colors.red)));
              } else {
                return const VerifyEmail();
              }
            }),
      );
}
