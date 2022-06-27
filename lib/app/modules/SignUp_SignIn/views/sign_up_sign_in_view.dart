import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Sign_In/views/sign_in_view.dart';
import 'package:planet_pets_app/app/modules/Sign_Up/views/sign_up_view.dart';
import 'package:planet_pets_app/app/modules/home/views/user.dart';
import 'package:planet_pets_app/utils/colors.dart';

import '../controllers/sign_up_sign_in_controller.dart';

class SignUpSignInView extends GetView<SignUpSignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Image.asset('assets/images/PPLogo.png'),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'Poppins-Bold',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'PLANET ',
                          style: TextStyle(color: AppColor.mainColor)),
                      TextSpan(
                          text: 'PETS',
                          style: TextStyle(color: AppColor.blankColor)),
                    ]),
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: 350,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignInView();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: 350,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpView();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColor.bgColor1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(width: 2.0, color: AppColor.blankColor)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
