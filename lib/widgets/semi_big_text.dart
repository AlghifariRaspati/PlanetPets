import 'package:flutter/cupertino.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

class SemiBigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;

  SemiBigText({
    Key? key,
    this.color = const Color(0xFFE15a0c),
    required this.text,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontFamily: "Poppins",
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w700),
    );
  }
}
