import 'package:e_commerce_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookSearchPage extends StatefulWidget {
  const BookSearchPage({Key? key}) : super(key: key);

  @override
  State<BookSearchPage> createState() => _BookSearchPageState();
}

class _BookSearchPageState extends State<BookSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20.0,),
        //filter text field
        Container(
          padding: EdgeInsets.only(left: 15.0,right: 15.0),
          height: 60,
          child: TextField(
            decoration: InputDecoration(
                focusColor: kPrimaryColor,
                filled: true,
                labelText: AppLocalizations.of(context).filter,
                fillColor: Color(0xfff0f0f0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                labelStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300
                )
            ),
          ),
        ),
      ],
    );
  }
}
