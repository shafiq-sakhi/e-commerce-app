import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  final Function onPressed;
  const LoginPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 330,
            height: 60,
            padding: EdgeInsets.only(left: 15,top: 15),
            child: BigText(
              text: AppLocalizations.of(context).login,
              color: Colors.white,
              size: 20,
              fontWeight: FontWeight.w500,
            ),
            decoration: BoxDecoration(
              color: kLoginHeaderColor,
            ),
          ),
          Container(
            height: 250,
            width: 300,
            child: Center(
              child: GestureDetector(
                onTap: ()=> onPressed(),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/logo.png')
                    )
                  ),
                ),
              ),
            ),
            decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)
                ),
                boxShadow:const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0,5),
                  ),
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0,0)
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
