import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/store_home_dart_view.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/medium_text.dart';
import '../../../../widgets/semi_big_text.dart';

class StoreRegister extends StatelessWidget {
  const StoreRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
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
                    text: "Store Details",
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
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width30),
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.mainBlackColor
                                          .withOpacity(0.2))),
                              labelText: "Store Name",
                              labelStyle: TextStyle(
                                  color:
                                      AppColor.mainBlackColor.withOpacity(0.2),
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
                              labelText: "Whatsapp Number",
                              labelStyle: TextStyle(
                                  color:
                                      AppColor.mainBlackColor.withOpacity(0.2),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
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
                                                const StoreHomeDartView(),
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
