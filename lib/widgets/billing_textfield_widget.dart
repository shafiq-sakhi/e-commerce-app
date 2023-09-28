import 'package:e_commerce_app/utilities/constants.dart';
import 'package:flutter/material.dart';


class BillingTextFieldWidget extends StatelessWidget {
  final labelText;
  BillingTextFieldWidget({
    Key? key,
    required this.focusNode, this.labelText,
  }) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      child: TextField(
        cursorColor: kPrimaryColor,
        focusNode: focusNode,
        decoration: InputDecoration(
            isDense: true,
            labelText: labelText,
            focusColor: kPrimaryColor,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 0),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffaaaaaa))
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor,width: 2)
            ),
            labelStyle: TextStyle(
                fontSize: 14,
                color: focusNode.hasFocus? kPrimaryColor: Color(0xffaaaaaa),
                height: 0
            )
        ),
      ),
    );
  }
}
