import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor1,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Image.asset('assets/images/rafiki3.png'),
          ),
          Text(
            'Sign in or Sign up on the\n next page to continue inside!',
            style: TextStyle(
                color: AppColor.blankColor,
                fontFamily: 'Poppins',
                fontSize: Dimensions.font20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
