import 'package:flutter/cupertino.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

class ItemText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  ItemText(
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
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color,
        fontFamily: "Poppins",
        fontSize: size == 0 ? Dimensions.font12 : size,
        height: height,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
