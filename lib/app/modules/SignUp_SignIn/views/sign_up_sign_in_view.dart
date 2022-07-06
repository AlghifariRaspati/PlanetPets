import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/auth_service.dart';
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
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
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
              SizedBox(
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
              SizedBox(
                height: Dimensions.height10,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: AppColor.blankColor.withOpacity(0.5),
                )),
                Text(
                  " OR ",
                  style: TextStyle(
                    color: AppColor.blankColor.withOpacity(0.5),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: AppColor.blankColor.withOpacity(0.5),
                )),
              ]),
              SizedBox(
                height: Dimensions.height10,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height50,
                child: ElevatedButton(
                    onPressed: () {
                      AuthService().signInWithGoogle(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: Dimensions.height25,
                          width: Dimensions.width25,
                          child: Image.asset(
                            "assets/images/google_icon.png",
                          ),
                        ),
                        SizedBox(width: Dimensions.height40),
                        Text(
                          "Continue with google",
                          style: TextStyle(
                              color: Color.fromARGB(255, 201, 201, 201),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: Dimensions.font16),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
