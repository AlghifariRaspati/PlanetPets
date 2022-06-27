import 'package:flutter/cupertino.dart';

class SemiBigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;

  SemiBigText({
    Key? key,
    this.color = const Color(0xFFE15a0c),
    required this.text,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontFamily: "Poppins",
          fontSize: size,
          fontWeight: FontWeight.w700),
    );
  }
}
