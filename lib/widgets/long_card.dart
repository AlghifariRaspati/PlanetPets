import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/item_text.dart';

class LongCard extends StatelessWidget {
  final ImageProvider imageProvider;
  final String title;
  final String price;
  final String amount;
  final String store;

  const LongCard(
      {Key? key,
      required this.imageProvider,
      required this.title,
      required this.price,
      required this.amount,
      required this.store})
      : super(key: key);

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            height: Dimensions.height100,
            width: Dimensions.width100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius8),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: imageProvider,
                )),
          ),
          SizedBox(
            width: Dimensions.width20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemText(
                  text: title, color: AppColor.mainBlackColor.withOpacity(0.7)),
              ItemText(
                  text: amount,
                  color: AppColor.mainBlackColor.withOpacity(0.7)),
              ItemText(
                  text: store, color: AppColor.mainBlackColor.withOpacity(0.7))
            ],
          ),
          SizedBox(
            width: Dimensions.width130,
          ),
          Column(
            children: [
              ItemText(
                text: price,
                color: AppColor.mainBlackColor.withOpacity(0.7),
              )
            ],
          )
        ],
      ),
    );
  }
}
