import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor1,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            child: Image.asset('assets/images/rafiki2.png'),
          ),
          Text(
            'Planet Pets is a catalog app\n that makes shopping for\n your pet needs more efficient!',
            style: TextStyle(
                color: AppColor.blankColor,
                fontFamily: 'Poppins',
                fontSize: Dimensions.height20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
