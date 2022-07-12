// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../auth_service.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/medium_text.dart';
import '../../../../widgets/semi_big_text.dart';

class PassOption extends StatefulWidget {
  const PassOption({Key? key}) : super(key: key);

  @override
  State<PassOption> createState() => _PassOptionState();
}

class _PassOptionState extends State<PassOption> {
  final _formKey = GlobalKey<FormState>();

  var newPass = " ";

  final passchangeController = TextEditingController();

  @override
  void dispose() {
    passchangeController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  updPass() async {
    try {
      FirebaseFirestore.instance.collection('User').doc(currentUser!.uid).set({
        'password': newPass,
      }, SetOptions(merge: true));

      await currentUser!.updatePassword(newPass);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(" Your Password has been changed. Log in again!")));
      AuthService().signOut(context);
    } catch (error) {}
  }

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
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width30),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: passchangeController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Enter min. 6 characters'
                                    : null,
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.mainBlackColor
                                            .withOpacity(0.1))),
                                labelText: "New password",
                                labelStyle: TextStyle(
                                    color: AppColor.mainBlackColor
                                        .withOpacity(0.2),
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
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                newPass = passchangeController.text;
                              });
                              updPass();
                            }
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
          ),
        ));
  }
}
