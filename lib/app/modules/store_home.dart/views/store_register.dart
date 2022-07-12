import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/store_home_dart_view.dart';
import 'package:planet_pets_app/resources/models/usermodel.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/medium_text.dart';
import '../../../../widgets/semi_big_text.dart';

class StoreRegister extends StatefulWidget {
  UserModels user;
  StoreRegister(this.user, {Key? key}) : super(key: key);

  @override
  State<StoreRegister> createState() => _StoreRegisterState();
}

class _StoreRegisterState extends State<StoreRegister> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    storeController.dispose();
    waController.dispose();
  }

  final TextEditingController storeController = TextEditingController();

  final TextEditingController waController = TextEditingController();

  void uploadStore() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc(widget.user.docId)
        .update({
      'email': widget.user.email,
      'password': widget.user.password,
      'role': 'store owner',
      'store': storeController.text,
      'username': widget.user.username,
      'wa': waController.text,
    });
  }

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
                          controller: storeController,
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
                          controller: waController,
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
                                        uploadStore();

                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                StoreHomeDartView(),
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
