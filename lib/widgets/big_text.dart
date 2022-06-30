import 'package:flutter/cupertino.dart';
import 'package:planet_pets_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;

  BigText({
    Key? key,
    this.color = const Color(0xFF000000),
    required this.text,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontFamily: "Poppins",
        fontSize: size == 0 ? Dimensions.font24 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
