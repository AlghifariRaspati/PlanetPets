import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/options_controller.dart';

class OptionsView extends GetView<OptionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            centerTitle: false,
            leading: Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 255, 79, 50),
              size: 40,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
              child: Text(
                "Settings",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 79, 50),
                    fontFamily: "Poppins",
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 29, 34, 52),
              ),
            ),
          )),
      body: Container(
          child: Column(
        children: [],
      )),
    );
  }
}
