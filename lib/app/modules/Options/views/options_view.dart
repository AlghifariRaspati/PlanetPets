import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/views/sign_up_sign_in_view.dart';
import 'package:planet_pets_app/app/modules/Sign_In/views/sign_in_view.dart';
import 'package:planet_pets_app/app/routes/app_pages.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/widgets/Medium_Text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';
import 'package:planet_pets_app/wrapper.dart';

import '../controllers/options_controller.dart';

class OptionsView extends GetView<OptionsController> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: AppBar(
              centerTitle: false,
              iconTheme: IconThemeData(color: AppColor.mainColor, size: 35),
              backgroundColor: AppColor.bgColor1,
              elevation: 0,
              title: Transform(
                  transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                  child: SemiBigText(
                    text: "Settings",
                    color: AppColor.mainColor,
                  )),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: AppColor.bgColor1,
                ),
              ),
            ),
          )),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change E-Mail",
                      style: TextStyle(
                          color: AppColor.mainBlackColor.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )),
                Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                          color: AppColor.mainBlackColor.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )),
                Divider(
                  height: 1,
                  thickness: 1.5,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            height: 50,
            width: 200,
            child: ElevatedButton(
                // onPressed: () => FirebaseAuth.instance.signOut(),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Wrapper()),
                          (route) => false));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.bgColor2,
                  shadowColor: AppColor.mainBlackColor.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 25,
                        width: 25,
                        child: Icon(
                          Icons.logout_outlined,
                          color: AppColor.mainBlackColor,
                        )),
                    SizedBox(width: 40),
                    MediumText(
                      text: "Log Out",
                      color: AppColor.mainBlackColor.withOpacity(0.7),
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }
}
