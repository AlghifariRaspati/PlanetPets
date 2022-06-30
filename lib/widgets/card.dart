import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/item_text.dart';
import 'medium_text.dart';

class CustomCard extends StatelessWidget {
  final ImageProvider imageProvider;
  final String title;
  final String price;

  const CustomCard({
    Key? key,
    required this.imageProvider,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            style: BorderStyle.solid,
            color: AppColor.mainBlackColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(Dimensions.radius8),
        color: AppColor.blankColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 4,
            color: AppColor.mainBlackColor.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: Dimensions.height100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius8),
                    topRight: Radius.circular(Dimensions.radius8)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Container(
            padding: EdgeInsets.only(left: Dimensions.width10),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemText(
                    text: title,
                    color: AppColor.mainBlackColor.withOpacity(0.7)),
                SizedBox(
                  height: Dimensions.height5,
                ),
                ItemText(text: price, color: AppColor.bgColor1),
                SizedBox(
                  height: Dimensions.height10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
