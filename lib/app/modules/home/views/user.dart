import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/home/views/history.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/Medium_Text.dart';
import '../../../../widgets/semi_big_text.dart';
import '../../Options/views/options_view.dart';
import '../../profile/views/profile_view.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const History();
                            }));
                          },
                          child: SizedBox(
                            child: Icon(
                              Icons.receipt_long_outlined,
                              color: AppColor.mainColor,
                              size: Dimensions.icon25,
                            ),
                          ),
                        ),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.height30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: Dimensions.height50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20)),
                          ),
                          child: Text(
                            "Open Store",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: Dimensions.font16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
