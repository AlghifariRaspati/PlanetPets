import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planet_pets_app/app/modules/home/views/item_info.dart';
import 'package:planet_pets_app/utils/colors.dart';
import 'package:planet_pets_app/utils/dimensions.dart';
import 'package:planet_pets_app/widgets/card.dart';
import 'package:planet_pets_app/widgets/semi_big_text.dart';

import '../../../../resources/database/database.dart';
import '../../../../resources/models/models.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: Dimensions.top130,
                  color: AppColor.bgColor1,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    padding: EdgeInsets.only(top: Dimensions.height20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SemiBigText(
                          text: "Favorite",
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
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
