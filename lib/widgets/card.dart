import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
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
    return InkWell(
      child: Container(
        width: 100,
        height: 180,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              style: BorderStyle.solid,
              color: AppColor.mainBlackColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemText(
                      text: title,
                      color: AppColor.mainBlackColor.withOpacity(0.7)),
                  SizedBox(
                    height: 5,
                  ),
                  ItemText(text: price, color: AppColor.bgColor1),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
