import 'package:flutter/cupertino.dart';

class HeaderText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;

  HeaderText({
    Key? key,
    this.color = const Color(0xFFff4f32),
    required this.text,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: "Poppins",
        fontSize: size,
      ),
    );
  }
}
