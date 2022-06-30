import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:planet_pets_app/app/modules/home/views/location.dart';
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
                              SemiBigText(
                                text: 'Hi, User',
                                color: AppColor.mainBlackColor,
                              )
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                height: MediaQuery.of(context).size.height * 0.75,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) => CustomCard(
                        imageProvider: AssetImage("assets/images/dog_toy.png"),
                        title: "Dog Toy",
                        price: "IDR 100.000"),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: Dimensions.height20,
                        crossAxisSpacing: Dimensions.width20,
                        crossAxisCount: 2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
