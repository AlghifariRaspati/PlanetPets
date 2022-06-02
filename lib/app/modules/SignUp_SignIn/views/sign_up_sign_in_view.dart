import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Sign_Up/views/sign_up_view.dart';

import '../controllers/sign_up_sign_in_controller.dart';

class SignUpSignInView extends GetView<SignUpSignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 34, 52),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                child: Image.asset('assets/images/PPLogo.png'),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: 'PLANET ',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 79, 50))),
                    TextSpan(
                        text: 'PETS', style: TextStyle(color: Colors.white)),
                  ]),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              width: 350,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUpView();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 29, 34, 52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: BorderSide(width: 2.0, color: Colors.white)),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 79, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
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
          ],
        ),
      ),
    );
  }
}
