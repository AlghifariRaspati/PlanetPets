import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Options/views/options_view.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/app/modules/home/views/user.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';
import 'package:planet_pets_app/widgets/small_text.dart';
import 'package:planet_pets_app/widgets/smallest_text.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: Dimensions.top150,
                      color: AppColor.bgColor1,
                    ),
                    AppBar(
                      iconTheme: IconThemeData(
                          color: AppColor.mainColor, size: Dimensions.icon35),
                      backgroundColor: AppColor.bgColor1,
                      elevation: 0,
                    ),
                    Positioned.fill(
                      bottom: -150,
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/UserIcon.png')),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height70,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: MediumText(
                                text: "Edit Picture",
                                color: AppColor.mainColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width30),
                        child: Column(
                          children: [
                            TextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.mainBlackColor
                                              .withOpacity(0.2))),
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                      color: AppColor.mainBlackColor
                                          .withOpacity(0.2),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700)),
                            ),
                            TextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.mainBlackColor
                                              .withOpacity(0.2))),
                                  labelText: "Username",
                                  labelStyle: TextStyle(
                                      color: AppColor.mainBlackColor
                                          .withOpacity(0.2),
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.height20),
              child: SizedBox(
                width: Dimensions.width130,
                height: Dimensions.height50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NavBar();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.bgColor1,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                    ),
                    child: MediumText(
                      text: "Save",
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
