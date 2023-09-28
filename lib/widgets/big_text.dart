import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
  FontWeight fontWeight;
  final double height;
  BigText({
    Key? key,
    required this.text,
    this.color=Colors.black,
    this.size=16,
    this.fontWeight=FontWeight.w700,
    this.height=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.visible,
      style: TextStyle(
        height: height,
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
