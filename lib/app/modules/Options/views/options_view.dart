import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Options/views/Email_Option.dart';
import 'package:planet_pets_app/app/modules/Options/views/Password_Option.dart';
import 'package:planet_pets_app/auth_service.dart';
import 'package:planet_pets_app/resources/models/usermodel.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';
import '../controllers/options_controller.dart';

class OptionsView extends GetView<OptionsController> {
  const OptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Dimensions.top100),
          child: SafeArea(
            child: AppBar(
              centerTitle: false,
              iconTheme: IconThemeData(
                  color: AppColor.mainColor, size: Dimensions.icon35),
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
            margin: EdgeInsets.symmetric(vertical: Dimensions.height5),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailOption()));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Change E-Mail",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.mainBlackColor.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.font16),
                      ),
                    )),
                const Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PassOption()));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Change Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.mainBlackColor.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.font16),
                      ),
                    )),
                const Divider(
                  height: 1,
                  thickness: 1.5,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width100,
            ),
            margin: EdgeInsets.only(bottom: Dimensions.height20),
            height: Dimensions.height50,
            width: MediaQuery.of(context).size.width / 1.2,
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: MediumText(
                                text: "are you sure you want to log out?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: SemiBigText(
                                    text: "Cancel",
                                  )),
                              TextButton(
                                  onPressed: () {
                                    AuthService().signOut(context);
                                  },
                                  child: SemiBigText(
                                    text: "Yes",
                                  ))
                            ],
                          ));
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.bgColor2,
                  shadowColor: AppColor.mainBlackColor.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius16)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: Dimensions.height25,
                        width: Dimensions.width25,
                        child: Icon(
                          Icons.logout_outlined,
                          color: AppColor.mainBlackColor,
                        )),
                    SizedBox(width: Dimensions.width10),
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
