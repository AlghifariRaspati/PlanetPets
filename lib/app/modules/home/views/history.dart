import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planet_pets_app/app/modules/home/views/item_info.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

import 'package:planet_pets_app/widgets/semi_big_text.dart';

import '../../../../resources/database/database.dart';
import '../../../../resources/models/models.dart';
import '../../../../widgets/small_text.dart';

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
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: Database().streamCatalog(),
          builder:
              (_, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: Dimensions.height100,
                width: Dimensions.width100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius8),
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
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: AppColor.mainBlackColor.withOpacity(0.7),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.font12),
                            children: [
                          TextSpan(text: models.amount.toString()),
                          TextSpan(text: "x")
                        ])),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.store_rounded,
                          color: AppColor.mainBlackColor.withOpacity(0.7),
                        ),
                        SmallText(
                          text: models.store,
                          color: AppColor.mainBlackColor.withOpacity(0.7),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: Dimensions.width10),
            child: Column(
              children: [
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
                  height: Dimensions.height50,
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
