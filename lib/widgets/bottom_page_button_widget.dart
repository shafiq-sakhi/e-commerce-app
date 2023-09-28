import 'package:flutter/material.dart';
import 'big_text.dart';


class BottomPageButtonWidget extends StatelessWidget {
  final String titleText;
  final String descripeText;
  final IconData icon;

  const BottomPageButtonWidget({
    Key? key, required this.titleText, required this.descripeText, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        child: FlatButton(
            onPressed: (){},
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 20,
                  ),
                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: titleText,fontWeight: FontWeight.w400,),
                      SizedBox(height: 5,),
                      BigText(text: descripeText,fontWeight: FontWeight.w400,size: 14,),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
