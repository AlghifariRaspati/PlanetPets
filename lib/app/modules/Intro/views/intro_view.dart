import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/Intro/views/intro_screen1.dart';
import 'package:planet_pets_app/app/modules/Intro/views/intro_screen2.dart';
import 'package:planet_pets_app/app/modules/Intro/views/intro_screen3.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/views/sign_up_sign_in_view.dart';
import 'package:planet_pets_app/app/routes/app_pages.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [IntroPage1(), IntroPage2(), IntroPage3()],
        ),
        Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: SemiBigText(
                      text: "Back",
                    )),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      activeDotColor: AppColor.mainColor,
                      dotColor: AppColor.bgColor2,
                      dotHeight: Dimensions.height8,
                      dotWidth: Dimensions.width12),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpSignInView();
                          }));
                        },
                        child: SemiBigText(
                          text: "Next",
                        ))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: SemiBigText(
                          text: "Next",
                        )),
              ],
            ))
      ],
    ));
  }
}
