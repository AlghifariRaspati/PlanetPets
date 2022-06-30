import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/provider/google_sign_in.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/main.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:planet_pets_app/widgets/utils.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool _isObscure = true;
  // bool _isObscure2 = true;
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width40,
                      vertical: Dimensions.height30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius30),
                          topRight: Radius.circular(Dimensions.radius30)),
                      color: AppColor.blankColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediumText(
                              text: "Email",
                              color: AppColor.mainColor,
                            ),
                            SizedBox(height: Dimensions.height5),
                            TextFormField(
                              controller: emailController,
                              style: TextStyle(height: 0.7),
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 233, 233, 233),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ))),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            MediumText(
                              text: "Password",
                              color: AppColor.mainColor,
                            ),
                            SizedBox(height: Dimensions.height5),
                            TextFormField(
                              controller: passwordController,
                              style: TextStyle(height: 0.7),
                              obscureText: _isObscure,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  value != null && value.length < 6
                                      ? 'Enter min. 6 characters'
                                      : null,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 233, 233, 233),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: Dimensions.height50,
                        child: ElevatedButton(
                            onPressed: signUp,
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20)),
                            ),
                            child: MediumText(
                              text: "Sign Up",
                              color: AppColor.blankColor,
                            )),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        Text(
                          " OR ",
                          style: TextStyle(
                            color: AppColor.mainBlackColor.withOpacity(0.2),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                      ]),
                      SizedBox(height: Dimensions.height10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: Dimensions.height50,
                        child: ElevatedButton(
                            onPressed: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin().then((value) =>
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => NavBar()),
                                      (route) => false));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: Dimensions.height25,
                                  width: Dimensions.width25,
                                  child: Image.asset(
                                    "assets/images/google_icon.png",
                                  ),
                                ),
                                SizedBox(width: Dimensions.width40),
                                MediumText(
                                  text: "Continue With Google",
                                  color: AppColor.googleColor,
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.toString());

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NavBar()),
        (Route<dynamic> route) => false);
    ;
  }
}
