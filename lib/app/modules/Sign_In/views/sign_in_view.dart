import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/home/views/home_view.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 34, 52),
      body: SafeArea(
        child: ListView(children: [
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
                                color: Color.fromARGB(255, 255, 79, 50),
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
                    Container(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 29, 34, 52),
                              shadowColor: Colors.transparent),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 79, 50),
                                fontFamily: "Poppins"),
                          )),
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeView();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 79, 50),
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
                              return HomeView();
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
                                    color: Color.fromARGB(255, 201, 201, 201),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 16),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
