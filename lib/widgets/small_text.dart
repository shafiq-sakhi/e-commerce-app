import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextAlign textAlign;
  final double height;

  SmallText({
    Key? key,
    required this.text,
    this.color= Colors.black,
    this.size=14.0,
    this.textAlign=TextAlign.center,
    this.height=1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400,
      ),
    );
  }
}
