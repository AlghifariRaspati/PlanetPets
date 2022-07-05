import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/medium_text.dart';
import '../../../../widgets/semi_big_text.dart';
import '../../Options/views/options_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/store_home_dart_controller.dart';

class StoreHomeDartView extends GetView<StoreHomeDartController> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: AppColor.bgColor2,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: Dimensions.top150,
                    color: AppColor.bgColor1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.height10,
                        horizontal: Dimensions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: Dimensions.height15,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Image.asset('assets/images/UserIcon.png'),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.height25,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SemiBigText(
                      text: user.email!,
                      color: AppColor.mainBlackColor.withOpacity(0.7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfileView();
                              }));
                            },
                            child: MediumText(
                              text: "Edit Profile",
                              color: AppColor.mainColor,
                            )),
                        Text("  |  "),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return OptionsView();
                              }));
                            },
                            child: MediumText(
                              text: "Settings",
                              color: AppColor.mainColor,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
