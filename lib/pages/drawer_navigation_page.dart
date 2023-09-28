import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerNavigationPage extends StatelessWidget {
  final Function gotoHomePage;
  final Function gotoBooks;
  const DrawerNavigationPage({Key? key, required this.gotoHomePage, required this.gotoBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 80,bottom: 55),
      width: 200,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              width: 100,
              child: FlatButton(
                focusColor: kPrimaryColor,
                highlightColor: kPrimaryColor,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.close,color: kPrimaryColor,),
                    SmallText(text: AppLocalizations.of(context).close,color: kPrimaryColor,size: 16,)
                  ],
                ),
              ),
            ),
            Container(
              height: 170,
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 25,right: 25,bottom: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/logo.png')
                )
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 0.5,
              color: Colors.grey,
            ),
            FlatButton(
              onPressed: (){
                gotoHomePage();
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.home,color: kPrimaryColor,),
                  SmallText(text: AppLocalizations.of(context).home,size: 16,)
                ],
              ),
            ),
            FlatButton(
              onPressed: (){
                gotoBooks();
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.library_books,color: kPrimaryColor,),
                  SmallText(text: AppLocalizations.of(context).books,size: 16,)
                ],
              ),
            ),
            FlatButton(
              onPressed: (){},
              child: Row(
                children: [
                  Icon(Icons.account_circle,color: kPrimaryColor,),
                  SmallText(text: AppLocalizations.of(context).myAccount,size: 16,)
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
