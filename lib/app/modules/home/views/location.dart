import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
                backgroundColor: AppColor.bgColor2,
                elevation: 0,
                title: Transform(
                    transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                    child: SemiBigText(
                      text: "Location",
                      color: AppColor.mainColor,
                    )),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: AppColor.bgColor1,
                  ),
                ),
              ),
            )),
        body: Center(
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
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700),
                )),
          ),
        ));
  }
}
