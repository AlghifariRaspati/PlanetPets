import 'package:flutter/material.dart';
import 'package:planet_pets_app/widgets/sign_in.dart';

import '../controllers/sign_in_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
