import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/Options/views/Email_Option.dart';
import 'package:planet_pets_app/app/modules/Options/views/Password_Option.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/edit_products.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/add_products.dart';
import 'package:planet_pets_app/auth_service.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Dimensions.top100),
          child: SafeArea(
            child: AppBar(
              centerTitle: false,
              iconTheme: IconThemeData(
                  color: AppColor.mainColor, size: Dimensions.icon35),
              backgroundColor: AppColor.bgColor1,
              elevation: 0,
              title: Transform(
                  transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                  child: SemiBigText(
                    text: "Manage Products",
                    color: AppColor.mainColor,
                  )),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: AppColor.bgColor1,
                ),
              ),
            ),
          )),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.height5),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddProducts()));
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Products",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.mainBlackColor.withOpacity(0.7),
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.font16),
                          ),
                          Icon(
                            Icons.outbox_rounded,
                            color: AppColor.mainBlackColor.withOpacity(0.7),
                          )
                        ],
                      ),
                    )),
                const Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProduct()));
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Edit Products",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.mainBlackColor.withOpacity(0.7),
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.font16),
                          ),
                          Icon(
                            Icons.edit_rounded,
                            color: AppColor.mainBlackColor.withOpacity(0.7),
                          )
                        ],
                      ),
                    )),
                const Divider(
                  height: 1,
                  thickness: 1.5,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
