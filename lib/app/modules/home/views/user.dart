import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/home/views/history.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/store_register.dart';
import 'package:planet_pets_app/resources/database/database.dart';
import 'package:planet_pets_app/resources/models/usermodel.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/medium_text.dart';
import '../../../../widgets/semi_big_text.dart';
import '../../Options/views/options_view.dart';
import '../../profile/views/profile_view.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: Database(docId: user.uid).docUser(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Text("No data found");
        } else {
          UserModels userModels = UserModels.formData(snapshot.data!);

          print(userModels);

          return Scaffold(
            backgroundColor: AppColor.bgColor2,
            body: SingleChildScrollView(
              child: SafeArea(child: _userDetail(context, userModels)),
            ),
          );
        }
      },
    );
  }
}

Widget _userDetail(BuildContext context, UserModels userModels) {
  final user = FirebaseAuth.instance.currentUser!;
  return Container(
    child: SafeArea(
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: Database(docId: user.uid).docUser(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const Text("No data found");
            } else {
              UserModels userModels = UserModels.formData(snapshot.data!);
              return Column(
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
                    height: Dimensions.height15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SemiBigText(
                          text: userModels.username,
                          color: AppColor.mainBlackColor.withOpacity(0.7),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        MediumText(
                          text: userModels.email,
                          color: AppColor.bgColor1.withOpacity(0.7),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height30),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: Dimensions.height50,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content:
                                              MediumText(text: "Create store?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: SemiBigText(
                                                  text: "Cancel",
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            StoreRegister(
                                                                userModels)),
                                                  ).then((value) =>
                                                      Navigator.pop(context));
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20)),
                              ),
                              child: Text(
                                "Create Store",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: Dimensions.font16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          }),
    ),
  );
}
