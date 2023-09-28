import 'package:e_commerce_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class SpecialButtonWidget extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final double height;
  final double width;
  final double radius;
  final Color color;

  SpecialButtonWidget({
    Key? key,
    required this.icon,
    this.iconSize=22,
    this.height=40,
    this.width=40,
    this.radius=80,
    this.color=Colors.black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                offset: Offset(0,2)
            ),
          ]
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: iconSize,
        ),
      ),
    );
  }

}
