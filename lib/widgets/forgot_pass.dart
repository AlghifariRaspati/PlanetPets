import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/main.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/widgets/big_text.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';
import 'package:planet_pets_app/widgets/utils.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.bgColor1,
        appBar: AppBar(
          backgroundColor: AppColor.bgColor1,
          elevation: 0,
          title: MediumText(
            text: "Reset Password",
            color: AppColor.mainColor,
          ),
          iconTheme: IconThemeData(color: AppColor.mainColor, size: 35),
        ),
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    SemiBigText(
                      text: "Receive an email to \nreset your password",
                      color: AppColor.mainColor,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      cursorColor: AppColor.blankColor,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.blankColor)),
                          labelText: "Email",
                          labelStyle: TextStyle(color: AppColor.blankColor)),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          primary: AppColor.mainColor),
                      onPressed: resetPassword,
                      icon: Icon(Icons.email_outlined),
                      label: Text(
                        "Reset Password",
                        style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      Utils.showSnackBar("Password reset email has been sent");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
