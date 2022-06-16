import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
      body: Column(
        children: [
          Container(
              height: 150,
              color: AppColor.bgColor1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SemiBigText(
                      text: "Favorite",
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
