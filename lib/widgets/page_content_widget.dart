import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/utilities/dimensions.dart';
import 'package:e_commerce_app/utilities/global_functions.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_to_mycart_button.dart';

class PageContentWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final int price;
  final int discount;
  final int percentage;
  final Function onTap;
  final Widget addMyCartButton;

  PageContentWidget(
      {Key? key,
        required this.imagePath,
        required this.name,
        required this.price,
        required this.discount,
        required this.percentage,
        required this.onTap,
        required this.addMyCartButton,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity
      ),
      width: Dimensions.bookContent170,
      margin: EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image
          FlatButton(
            onPressed: ()=> onTap(),
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 3),
              height: Dimensions.bookContent180,
              width: Dimensions.bookContent130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imagePath != '' ? NetworkImage(imagePath):
                      AssetImage('assets/image/alphabet1.jpg') as ImageProvider
                  )
              ),
            ),
          ),
          SmallText(text: name),
          SizedBox(height: 5.0,),
          // if it offer any discount
          discount ==0?BigText(text: '₹' + formatNumber(price)):
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(text: '₹' + formatNumber(price-discount)),
                  SmallText(text: '('+percentage.toString()+'%)')
                ],
              ),
              SizedBox(height: 5.0,),
              Text(
                  'M.R.P.:'+'₹' + formatNumber(price),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough
                ),
              )
            ],
          ),
          //button
          addMyCartButton
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 1.0,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.solid
            ),
            BoxShadow(
                color: Color(0xffe8e8e8),
                blurRadius: 3.0,
                offset: Offset(0, 0)
            ),
          ]
      ),
    );
  }
}