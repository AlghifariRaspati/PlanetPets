import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/Options/views/options_view.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/medium_text.dart';
import '../../../../widgets/semi_big_text.dart';

class PassOption extends StatelessWidget {
  const PassOption({Key? key}) : super(key: key);

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
                      text: "Change password",
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
                  margin: EdgeInsets.only(top: Dimensions.height20),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                  child: Column(
                    children: [
                      TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.mainBlackColor
                                          .withOpacity(0.1))),
                              labelText: "Current password",
                              labelStyle: TextStyle(
                                  color:
                                      AppColor.mainBlackColor.withOpacity(0.2),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700))),
                      TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.mainBlackColor
                                          .withOpacity(0.1))),
                              labelText: "New password",
                              labelStyle: TextStyle(
                                  color:
                                      AppColor.mainBlackColor.withOpacity(0.2),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700)))
                    ],
                  ),
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
                                    content:
                                        MediumText(text: "Confirm details?"),
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
                                                builder:
                                                    (BuildContext context) =>
                                                        OptionsView(),
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
                )
              ]),
        ));
  }
}
