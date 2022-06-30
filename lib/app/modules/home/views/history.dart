import 'package:flutter/material.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/long_card.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
                    text: "History",
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
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) => Column(
              children: [
                LongCard(
                  imageProvider: AssetImage("assets/images/dog_toy.png"),
                  title: "Dog Toy",
                  price: "IDR 100.000",
                  amount: '1x',
                  store: "Toys R'Us",
                ),
                SizedBox(
                  height: Dimensions.height10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
