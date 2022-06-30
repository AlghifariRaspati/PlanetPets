import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor1,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Image.asset('assets/images/rafiki.png'),
          ),
          Text(
            'Welcome to Planet Pets!,\n take a quick stroll to get\n familiar with our app',
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
