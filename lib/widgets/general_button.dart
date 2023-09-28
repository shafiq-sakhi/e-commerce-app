import 'package:e_commerce_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'big_text.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key? key,
    required this.onPressed, required this.text, this.width=170, this.borderRadius=5,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Center(
        child: Container(
          width: width,
          height: 35,
          padding: EdgeInsets.all(5),
          child: Center(
              child: BigText(
                text: text,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                size: 14,
              )
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: kPrimaryColor
          ),
        ),
      ),
    );
  }
}
