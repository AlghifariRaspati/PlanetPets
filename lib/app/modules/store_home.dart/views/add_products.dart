import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  // String? kosong;

  File? _image;
  String? imgUrl;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  void uploadImage() async {
    if (_image == null) {
      Fluttertoast.showToast(msg: "please select an image");
    }
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('Image')
          .child(DateTime.now().toString() + 'png');

      await ref.putFile(_image!);
      imgUrl = await ref.getDownloadURL();
      FirebaseFirestore.instance.collection('Catalog').doc().set({
        'title': titleController.text,
        'category': '',
        'description': descController.text,
        'image': imgUrl,
        'price': int.parse(priceController.text),
        'store': ''
      });

      _image = null;
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference addProducts =
        FirebaseFirestore.instance.collection('Catalog');

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
            child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height50,
                    ),
                    MediumText(text: "Product Information"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SmallText(
                      text: "Product name",
                    ),
                    TextField(
                      controller: titleController,
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
                    TextField(
                        controller: priceController,
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
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Type in the description of your product"),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      children: [
                        Container(
                            width: Dimensions.width150,
                            height: Dimensions.height100,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.mainColor),
                            ),
                            child: _image != null
                                ? Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  )
                                : FlutterLogo(
                                    size: Dimensions.height100,
                                  )),
                        InkWell(
                            onTap: () {
                              getImage();
                              // getImage().then((value) {
                              //   FirebaseStorage storage =
                              //       FirebaseStorage.instance;
                              //   Reference ref = storage
                              //       .ref("image/${titleController.text}.png")
                              //       .child(
                              //           "image1" + DateTime.now().toString());
                              //   UploadTask uploadTask = ref.putFile(_image!);
                              //   uploadTask.then((p0) async {
                              //     kosong = await p0.ref.getDownloadURL();
                              //     setState(() {});
                              //     print(kosong);
                              //   });
                              // });
                              // FirebaseFirestore.instance
                              //     .collection('Catalog')
                              //     .add({
                              //   'image': kosong,
                              //   'category': '',
                              //   'description': '',
                              //   'price': '',
                              //   'store': '',
                              //   'title': ''
                              // });
                            },
                            child: Icon(Icons.add_rounded,
                                size: Dimensions.height100,
                                color:
                                    AppColor.mainBlackColor.withOpacity(0.7)))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height100,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width25),
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
                                          content: MediumText(
                                              text: "Confirm Details?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: SemiBigText(
                                                  text: "Cancel",
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  uploadImage();

                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            StoreHomeDartView()),
                                                    (route) => false,
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius8)),
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
                    ),
                  ]))
        ])));
  }
}
