import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

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
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.height25,
                          ),
                          Container(
                              height: Dimensions.height100,
                              width: Dimensions.height100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius30),
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/user_placeholder.png"),
                                    fit: BoxFit.cover,
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height15,
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
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: MediumText(text: "Confirm details?"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: SemiBigText(
                                        text: "Cancel",
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const NavBar(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: SemiBigText(
                                        text: "Yes",
                                      ))
                                ],
                              ));
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
