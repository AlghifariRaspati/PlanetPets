import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
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
            Text('Sign Up')
          ],
        ),
      ),
    );
  }
}
