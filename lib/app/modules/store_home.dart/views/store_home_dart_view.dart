import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/products.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/store_account.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/store_profile.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import '../../../../auth_service.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/medium_text.dart';
import '../../../../widgets/semi_big_text.dart';
import '../controllers/store_home_dart_controller.dart';

class StoreHomeDartView extends GetView<StoreHomeDartController> {
  const StoreHomeDartView({Key? key}) : super(key: key);

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
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.height30),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: Dimensions.height50,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: MediumText(
                                          text: "Return to User account?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: SemiBigText(
                                              text: "Cancel",
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const NavBar()),
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
                            primary: AppColor.mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20)),
                          ),
                          child: Text(
                            "Go to User account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: Dimensions.font16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width30),
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const StoreAcc()));
                              },
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Manage Store Account",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: AppColor.mainBlackColor
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w700,
                                            fontSize: Dimensions.font16),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColor.mainBlackColor
                                            .withOpacity(0.7),
                                      )
                                    ],
                                  ))),
                          const Divider(
                            height: 1,
                            thickness: 1.5,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Products()));
                              },
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Manage Products",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: AppColor.mainBlackColor
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w700,
                                            fontSize: Dimensions.font16),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColor.mainBlackColor
                                            .withOpacity(0.7),
                                      )
                                    ],
                                  ))),
                          const Divider(
                            height: 1,
                            thickness: 1.5,
                          ),
                        ],
                      ),
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
