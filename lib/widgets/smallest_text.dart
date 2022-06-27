import 'package:flutter/cupertino.dart';

class SmallestText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallestText(
      {Key? key,
      this.color = const Color(0xFF000000),
      required this.text,
      this.size = 10,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: "Poppins",
          fontSize: size,
          height: height,
          fontWeight: FontWeight.bold),
    );
  }
}
