import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/home/views/home_view.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/widgets/Medium_Text.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _isObscure = true;
  bool _isObscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor1,
      body: SafeArea(
        child: ListView(children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/PPLogo.png",
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.72,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MediumText(
                    text: "Username",
                    color: AppColor.mainColor,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(height: 0.7),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.bgColor2,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MediumText(
                    text: "Email",
                    color: AppColor.mainColor,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(height: 0.7),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 233, 233, 233),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MediumText(
                    text: "Password",
                    color: AppColor.mainColor,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(height: 0.7),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 233, 233, 233),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            )),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MediumText(
                    text: "Confirm Password",
                    color: AppColor.mainColor,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(height: 0.7),
                    obscureText: _isObscure2,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 233, 233, 233),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            )),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure2
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          },
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NavBar();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: MediumText(
                          text: "Sign Up",
                          color: AppColor.blankColor,
                        )),
                  ),
                  SizedBox(height: 10),
                  Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Text(
                      " OR ",
                      style: TextStyle(
                        color: AppColor.mainBlackColor.withOpacity(0.1),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ]),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NavBar();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                "assets/images/google_icon.png",
                              ),
                            ),
                            SizedBox(width: 40),
                            MediumText(
                              text: "Continue With Google",
                              color: AppColor.googleColor,
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
