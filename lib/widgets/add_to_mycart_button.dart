import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/utilities/dimensions.dart';
import 'package:flutter/material.dart';

class AddToMyCartButton extends StatelessWidget {
  final Function onPressed;
  const AddToMyCartButton({
    Key? key, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.bookContent100-10,
      height: Dimensions.bookContent50,
      margin: EdgeInsets.all(5),
      child: FlatButton(
        onPressed: ()=> onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_cart, size: 25, color: Colors.white,),
            SizedBox(width: 3,),
            Text(
              'Add',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kPrimaryColor
      ),
    );
  }
}
