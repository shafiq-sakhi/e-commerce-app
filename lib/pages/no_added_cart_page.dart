import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/general_button.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoAddedCartPage extends StatelessWidget {
  final Function onPressed;
  NoAddedCartPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 60,
          margin: EdgeInsets.only(left: 20, top: 50, right: 20),
          padding: EdgeInsets.only(left: 15, top: 15),
          child: BigText(
            text: AppLocalizations.of(context).myCart,
            color: Colors.white,
            size: 22,
            fontWeight: FontWeight.w500,
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
        Container(
          height: 350,
          width: 300,
          margin: EdgeInsets.only(left: 20, bottom: 15, right: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigText(
                  text: AppLocalizations.of(context).yourShoppingCart,
                  size: 20,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 20,),
                SmallText(
                  text: AppLocalizations.of(context).youHaveNoItem,
                  height: 1.5,
                ),
                SizedBox(height: 25,),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        FontAwesomeIcons.cartShopping,
                        color: Colors.black,
                        size: 80,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Icon(
                        FontAwesomeIcons.xmark,
                        color: Colors.white,
                        size: 55,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                GeneralButton(onPressed: ()=> onPressed(),text: AppLocalizations.of(context).addProducts,),
              ],
            ),
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5)
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 1.0,
                    offset: Offset(0, 1),
                    blurStyle: BlurStyle.solid
                ),
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    offset: Offset(0, 0)
                ),
              ]
          ),
        ),
      ],
    );
  }
}