import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/products.dart';
import 'package:planet_pets_app/app/modules/store_home.dart/views/store_home_dart_view.dart';
import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/small_text.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/semi_big_text.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String dropdownValue = 'Bird';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor2,
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
                      text: "Manage Store Account",
                      color: AppColor.mainColor,
                    )),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: AppColor.bgColor1,
                  ),
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.height50,
                        ),
                        MediumText(
                          text: "Product Type",
                          color: AppColor.bgColor1,
                        ),
                        SizedBox(
                          height: Dimensions.height25,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius8)),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              style: TextStyle(
                                  color: AppColor.bgColor1,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimensions.font16,
                                  fontFamily: "Poppins"),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Bird',
                                'Cat',
                                'Dog',
                                'Fish'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        MediumText(text: "Product Information"),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        SmallText(
                          text: "Product name",
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Type in the name of your product"),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        MediumText(text: "Product Price"),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Type in the price of your product"),
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ]),
                        SizedBox(
                          height: Dimensions.height25,
                        ),
                        MediumText(text: "Product description"),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:
                                  "Type in the description of your product"),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Container(
                            width: Dimensions.width150,
                            height: Dimensions.width100,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius8)),
                            child: Column(children: [
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              Icon(
                                Icons.publish_rounded,
                                size: Dimensions.height50,
                              ),
                              MediumText(text: "Image")
                            ])),
                      ])),
              SizedBox(
                height: Dimensions.height100,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: Dimensions.height50,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content:
                                        MediumText(text: "Confirm Details?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: SemiBigText(
                                            text: "Cancel",
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const StoreHomeDartView()),
                                            );
                                          },
                                          child: SemiBigText(
                                            text: "Yes",
                                          ))
                                    ],
                                  ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius8)),
                        ),
                        child: Text(
                          "Add Product",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: Dimensions.font16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
