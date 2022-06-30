import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Sign_In/views/sign_in_view.dart';
import 'package:planet_pets_app/app/modules/Sign_Up/views/sign_up_view.dart';
import 'package:planet_pets_app/app/modules/home/views/user.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/sign_in.dart';
import 'package:planet_pets_app/widgets/sign_up.dart';

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
                        fontSize: Dimensions.font30,
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
                height: Dimensions.top150,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignIn();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: Dimensions.font16),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColor.bgColor1,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      side: BorderSide(width: 2.0, color: AppColor.blankColor)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: Dimensions.font16),
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
