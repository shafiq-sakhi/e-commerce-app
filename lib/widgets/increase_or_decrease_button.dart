import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'big_text.dart';
import 'special_button_widget.dart';

class IncreaseOrDecreaseButton extends StatelessWidget {
  final String orderAmount;
  final Function? increaseAmount;
  final Function? decreaseAmount;

  const IncreaseOrDecreaseButton({
    Key? key, this.orderAmount='1', this.increaseAmount, this.decreaseAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ()=> decreaseAmount!(),
          child: SpecialButtonWidget(
            icon: FontAwesomeIcons.minus,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10,),
        BigText(text: orderAmount,),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: ()=> increaseAmount!(),
          child: SpecialButtonWidget(
            icon: FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
