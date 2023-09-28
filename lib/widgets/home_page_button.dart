import 'package:flutter/material.dart';
import 'big_text.dart';

class HomePageButton extends StatelessWidget {
  final Color color;
  const HomePageButton({
    Key? key, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:15,left: 45,right: 45),
      height: 70,
      child: FlatButton(
        color: color,
        onPressed: (){},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag,color: Colors.white,),
            BigText(text: 'Shop Now',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}