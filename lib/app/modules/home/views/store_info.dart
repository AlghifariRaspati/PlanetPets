import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/small_text.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/semi_big_text.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: AppColor.bgColor2,
        body: SafeArea(
            child: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Dimensions.height200,
                color: AppColor.bgColor1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimensions.height15,
                    ),
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
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: Dimensions.height10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText(
                                text: user.email!,
                                color: AppColor.mainColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          Text(
                            "Jl. Jendral Ahmad Yani N0.819, Padasuka\nKec. Kiaracondong, Kota Bandung,\nJawa Barat",
                            style: TextStyle(color: AppColor.blankColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height25,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width100),
              child: Container(
                  padding: EdgeInsets.all(Dimensions.height10),
                  height: Dimensions.height100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.mainBlackColor.withOpacity(0.1),
                            blurRadius: Dimensions.height5)
                      ],
                      color: AppColor.blankColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius8)),
                  child: Text(
                    "This feature will be implemented in the next version",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: Dimensions.font16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700),
                  )),
            ),
          )
        ])));
  }
}
