import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/Options/views/options_view.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor2,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  color: AppColor.bgColor1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Icon(
                          Icons.receipt_long_outlined,
                          color: AppColor.mainColor,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Icon(
                          Icons.help_outline,
                          color: AppColor.mainColor,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  bottom: -150,
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/UserIcon.png')),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SemiBigText(
                    text: "Username",
                    color: AppColor.mainBlackColor.withOpacity(0.7),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {},
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserView();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 79, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          "Open Store",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
