import 'dart:io';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';
import 'package:planet_pets_app/app/modules/home/views/store_info.dart';
import 'package:planet_pets_app/resources/models/usermodel.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/big_text.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/small_text.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../resources/models/models.dart';
import '../../../../resources/models/usermodel.dart';

class ItemInfo extends StatelessWidget {
  final CatalogModels models;
  String? userModels;

  ItemInfo(this.models, {this.userModels, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Container(
                height: Dimensions.height390,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppColor.blankColor),
                child: ClipRRect(
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fitWidth,
                    placeholder: "assets/images/loading.gif",
                    image: models.image,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumText(text: "Store Info"),
                      ],
                    ),
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
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: Dimensions.height10,
                          horizontal: Dimensions.width15),
                      width: (MediaQuery.of(context).size.width),
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
                        children: [
                          Container(
                              height: Dimensions.height100,
                              width: Dimensions.height100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius8),
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/user_placeholder.png"),
                                    fit: BoxFit.cover,
                                  ))),
                          SizedBox(
                            width: Dimensions.width5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(text: models.store),
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.width5),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const StoreInfo();
                                              }));
                                            },
                                            child: Text(
                                              "See details",
                                              style: TextStyle(
                                                  color: AppColor.mainColor),
                                            ))),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.height5,
                                ),
                                const Text(
                                  "This is the store location",
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: Dimensions.height30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    // Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(
                    //                   Dimensions.radius16)),
                    //           child: Container(
                    //               height: Dimensions.height100,
                    //               width: Dimensions.height100,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.all(
                    //                     Radius.circular(Dimensions.radius8),
                    //                   ),
                    //                   image: const DecorationImage(
                    //                     image: AssetImage(
                    //                         "assets/images/user_placeholder.png"),
                    //                     fit: BoxFit.cover,
                    //                   )))),
                    //       SizedBox(
                    //         width: Dimensions.width15,
                    //       ),
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           MediumText(text: models.store),
                    //           Container(
                    //             padding:
                    //                 EdgeInsets.only(right: Dimensions.width10),
                    //             child: const Text(
                    //               "Jl. Jendral Ahmad Yani N0.819, Padasuka Kec. Kiaracondong, Kota Bandung, Jawa Barat",
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ])
                  ]),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
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
                    onPressed: () async {
                      String text =
                          "=Halo saya ingin membeli barang dari toko anda, barangnya adalah ${models.title}, harganya IDR ${models.price}";

                      if (Platform.isAndroid) {
                        // add the [https]
                        // ignore: deprecated_member_use
                        await launch(
                          "https://wa.me/${userModels}/?text${text}",
                        ); // new line
                        Navigator.of(context).pop();
                      } else {
                        // add the [https]
                        // ignore: deprecated_member_use
                        await launch(
                          "https://api.whatsapp.com/send?phone=${userModels}${text}",
                        );
                        Navigator.of(context).pop();
                      }

                      _openWhatsAppChat();
                    },
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
                    onPressed: _callNumber,
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

  void _openWhatsAppChat() async {
    String _phoneNumber = userModels.toString();
    var _url = "https://api.whatsapp.com/send?phone=$_phoneNumber";
    // var _url = "https://wa.me/$_phoneNumber?text=Hi";
    await launchUrlString(_url);
  }

  _callNumber() async {
    String _phoneNumber = userModels.toString();
    await FlutterPhoneDirectCaller.callNumber(_phoneNumber);
  }

  // void _makingPhoneCall() async {
  //   String _phoneNumber = userModels!.whatsapp.toString();
  //   var url = Uri.parse(_phoneNumber);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
