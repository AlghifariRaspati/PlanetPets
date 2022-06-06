import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/home/views/home_view.dart';

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
      backgroundColor: Color.fromARGB(255, 29, 34, 52),
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
                  Text(
                    'Username',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 79, 50),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(height: 0.7),
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
                  Text(
                    'E-Mail',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 79, 50),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
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
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 79, 50),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
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
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 79, 50),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
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
                    Expanded(child: Divider()),
                    Text(
                      " OR ",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.1),
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
            ),
          ),
        ]),
      ),
    );
  }
}
