import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:planet_pets_app/app/modules/home/views/item_info.dart';
import 'package:planet_pets_app/app/modules/home/views/location.dart';
import 'package:planet_pets_app/resources/database/database.dart';
import 'package:planet_pets_app/resources/models/models.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/card.dart';

import 'package:planet_pets_app/widgets/medium_text.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child:
                                    Image.asset("assets/images/UserIcon.png"),
                                width: Dimensions.height40,
                                height: Dimensions.width40,
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              RichText(
                                  overflow: TextOverflow.fade,
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: AppColor.mainBlackColor
                                              .withOpacity(0.7),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w700,
                                          fontSize: Dimensions.font16),
                                      children: [
                                        const TextSpan(text: "Hello, "),
                                        TextSpan(text: "User")
                                      ])),
                            ],
                          ),
                          //
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Location()),
                              );
                            },
                            child: Row(
                              children: [
                                MediumText(
                                  text: "Cijagra",
                                  color: AppColor.mainBlackColor,
                                ),
                                Icon(
                                  Icons.location_on_rounded,
                                  color: AppColor.mainColor,
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height50,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search....",
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius16),
                        borderSide: BorderSide(
                            color: AppColor.mainBlackColor, width: 2),
                      )),
                ),
              ),
              SizedBox(
                height: Dimensions.height40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SemiBigText(
                        text: "Categories",
                        color: AppColor.mainBlackColor,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: MediumText(
                          text: "See all",
                          color: AppColor.mainBlackColor,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: Dimensions.height40,
                            width: Dimensions.width40,
                            decoration: BoxDecoration(
                                color: AppColor.bgColor1,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius8)),
                            child: Icon(
                              Icons.star_border_outlined,
                              color: AppColor.mainColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MediumText(
                          text: "Popular",
                          color: AppColor.mainBlackColor.withOpacity(0.75),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: Dimensions.height40,
                              width: Dimensions.height40,
                              decoration: BoxDecoration(
                                  color: AppColor.bgColor1,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/Cat.png"),
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MediumText(
                          text: "Cat",
                          color: AppColor.mainBlackColor.withOpacity(0.75),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: Dimensions.height40,
                              width: Dimensions.height40,
                              decoration: BoxDecoration(
                                  color: AppColor.bgColor1,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius8)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset("assets/images/Dog.png"),
                              )),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        MediumText(
                          text: "Dog",
                          color: AppColor.mainBlackColor.withOpacity(0.75),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: Dimensions.height40,
                              width: Dimensions.width40,
                              decoration: BoxDecoration(
                                  color: AppColor.bgColor1,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/Fish.png"),
                              )),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        MediumText(
                          text: "Fish",
                          color: AppColor.mainBlackColor.withOpacity(0.75),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: Database().streamCatalog(),
                builder: (_,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    List<DocumentSnapshot<Map<String, dynamic>>> documents;
                    documents = snapshot.data!.docs;

                    return Wrap(
                      children: List.generate(
                        documents.length,
                        (index) {
                          DocumentSnapshot<Map<String, dynamic>> docs =
                              documents[index];

                          return _listCatalog(context, docs);
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _listCatalog(
    BuildContext context, DocumentSnapshot<Map<String, dynamic>> docs) {
  CatalogModels models = CatalogModels.formData(docs);

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ItemInfo(models);
          },
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width15),
      width: (MediaQuery.of(context).size.width / 2.5 - 5),
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
            height: Dimensions.height150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius8),
                  topRight: Radius.circular(Dimensions.radius8),
                ),
                image: DecorationImage(
                  image: NetworkImage(models.image),
                  fit: BoxFit.cover,
                )),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: AppColor.mainBlackColor.withOpacity(0.2),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Container(
            padding: EdgeInsets.only(left: Dimensions.width10),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  models.title,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font12,
                    color: AppColor.mainBlackColor.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(int.parse(models.price.toString())),
                  style: TextStyle(
                      color: AppColor.mainBlackColor.withOpacity(0.7),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: Dimensions.height10,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
