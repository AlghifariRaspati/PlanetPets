import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/big_text.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';
import 'package:planet_pets_app/widgets/small_text.dart';
import 'package:intl/intl.dart';

import '../../../../resources/models/models.dart';

class ItemInfo extends StatelessWidget {
  final CatalogModels models;
  const ItemInfo(this.models, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(children: [
            Stack(children: [
              Container(
                height: Dimensions.height400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppColor.blankColor),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius8)),
                  child: FadeInImage(
                    fit: BoxFit.fitWidth,
                    placeholder:
                        const AssetImage('assets/images/place-holder.png'),
                    image: NetworkImage(models.image),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.height25,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.mainBlackColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius30)),
                                height: Dimensions.height35,
                                width: Dimensions.width35,
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  size: Dimensions.icon35,
                                  color: AppColor.mainColor,
                                ))),
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.mainBlackColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius30)),
                                height: Dimensions.height35,
                                width: Dimensions.width35,
                                child: Icon(
                                  Icons.favorite_outline,
                                  size: Dimensions.icon25,
                                  color: AppColor.mainColor,
                                )))
                      ]))
            ]),
            Container(
              padding: EdgeInsets.only(left: Dimensions.width20),
              width: MediaQuery.of(context).size.width,
              height: Dimensions.height100,
              decoration: BoxDecoration(color: AppColor.blankColor),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: models.title,
                      color: AppColor.mainBlackColor.withOpacity(0.7),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(int.parse(models.price.toString())),
                      style: TextStyle(
                          color: AppColor.mainBlackColor.withOpacity(0.7),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: Dimensions.font16),
                    )
                  ]),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              width: MediaQuery.of(context).size.width,
              height: Dimensions.height200,
              decoration: BoxDecoration(color: AppColor.blankColor),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    MediumText(text: "Description"),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: AppColor.mainBlackColor.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Text(models.description)
                  ]),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: Dimensions.height100,
              decoration: BoxDecoration(color: AppColor.blankColor),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width10, right: Dimensions.width10),
                  width: MediaQuery.of(context).size.width / 2,
                  height: Dimensions.height50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.blankColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radius8),
                      ),
                      side: BorderSide(width: 1.0, color: AppColor.mainColor),
                    ),
                    child: Text(
                      "Chat",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: Dimensions.font16,
                          color: AppColor.mainColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: Dimensions.width10, left: Dimensions.width10),
                  width: MediaQuery.of(context).size.width / 2,
                  height: Dimensions.height50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius8)),
                    ),
                    child: Text(
                      "Call",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: Dimensions.font16),
                    ),
                  ),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
