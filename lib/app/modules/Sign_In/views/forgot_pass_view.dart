import 'package:flutter/material.dart';
import 'package:planet_pets_app/widgets/forgot_pass.dart';

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  @override
  Widget build(BuildContext context) {
    return ForgotPass();
  }
}
