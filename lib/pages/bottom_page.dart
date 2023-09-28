import 'package:e_commerce_app/widgets/bottom_page_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomPage extends StatelessWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ),
        Container(
          height:220,
          padding: EdgeInsets.only(top: 15,left: 10,bottom: 15),
          child: Column(
            children: [
              BottomPageButtonWidget(titleText: AppLocalizations.of(context).orderStatus,descripeText: AppLocalizations.of(context).truckYourOrder,icon: FontAwesomeIcons.truck,),
              BottomPageButtonWidget(titleText: AppLocalizations.of(context).shopNow,descripeText: AppLocalizations.of(context).oneShopForLarge ,icon: FontAwesomeIcons.cartShopping,),
            ],
          ),
        ),
      ],
    );
  }
}
