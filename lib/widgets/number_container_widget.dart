import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class NumberContainerWidget extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double size;
  final Color color;

  NumberContainerWidget({
    Key? key,
    required this.text,
    this.height=25,
    this.width=25,
    this.size=14,
    this.color=kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: SmallText(text: text,size: size,)),
    );
  }
}
