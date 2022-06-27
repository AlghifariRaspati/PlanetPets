import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Sign_In/views/forgot_pass_view.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/main.dart';

import 'package:planet_pets_app/widgets/utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.bgColor1,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/PPLogo.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins-Bold',
                                    fontSize: 30),
                                children: [
                              TextSpan(text: "Sign In\n"),
                              TextSpan(
                                  text: "Sign in with your Email and Password",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ]))),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        TextField(
                          controller: emailController,
                          style: TextStyle(height: 0.7),
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Email",
                              fillColor: Color.fromARGB(255, 233, 233, 233),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        TextField(
                          controller: passwordController,
                          style: TextStyle(height: 0.7),
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              hintText: "Password",
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
                        Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgotPassView();
                                }));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 79, 50),
                                    fontFamily: "Poppins"),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: signIn,
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: Colors.white.withOpacity(0.5),
                          )),
                          Text(
                            " OR ",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.white.withOpacity(0.5),
                          )),
                        ]),
                        SizedBox(
                          height: 10,
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
                                  Text(
                                    "Continue with google",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
