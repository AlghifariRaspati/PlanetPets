import 'package:flutter/cupertino.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

// ignore: must_be_immutable
class MediumText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  MediumText(
      {Key? key,
      this.color = const Color(0xFF000000),
      required this.text,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: "Poppins",
          fontSize: size == 0 ? Dimensions.font16 : size,
          height: height,
          fontWeight: FontWeight.bold),
    );
  }
}
