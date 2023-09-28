import 'package:e_commerce_app/controllers/book_controllers.dart';
import 'package:e_commerce_app/pages/billing_page.dart';
import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/utilities/global_functions.dart';
import 'package:e_commerce_app/utilities/mycart_data.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/general_button.dart';
import 'package:e_commerce_app/widgets/increase_or_decrease_button.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'no_added_cart_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyCartPage extends StatefulWidget {
  final Function onPressed;
  const MyCartPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  bool _gotoBillingPage=false;

  @override
  Widget build(BuildContext context) {
    return Provider.of<MyCartData>(context).addedIndex.length==0? NoAddedCartPage(onPressed: ()=> widget.onPressed(),):
      !_gotoBillingPage? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                BigText(text: 'My Cart (1)',size: 20,),
              ],
            ),
            SizedBox(height: 15.0,),
            //selected book description
            Container(
              constraints: BoxConstraints(
                  maxHeight: double.infinity
              ),
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 10,right: 10),
              padding: EdgeInsets.only(top: 15.0,bottom: 10.0,left: 20.0,right: 20.0),
              child: Column(
                children: addedBooks(),
              ),
              decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow:const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1.0,
                        offset: Offset(0,1),
                        blurStyle: BlurStyle.solid
                    ),
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 3.0,
                        offset: Offset(0,0)
                    ),
                  ]
              ),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: AppLocalizations.of(context).amount,size: 20,),
                  BigText(text: '₹155.00',size: 20,),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            //final description
            Container(
              height: 110,
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Padding(
                padding: EdgeInsets.only(top: 15,left: 15,bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SmallText(text: AppLocalizations.of(context).totalAmount,size: 15,),
                        SizedBox(width: 110,),
                        SmallText(text: '₹120.00'),
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        SmallText(text: AppLocalizations.of(context).deliveryCharges,size: 15,),
                        SizedBox(width: 10,),
                        SmallText(text: '₹35.00'),
                      ],
                    ),
                    SizedBox(height: 2,),
                    SmallText(text: AppLocalizations.of(context).location,size: 15,),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        BigText(text: AppLocalizations.of(context).totalPayableAmount,size: 15,),
                        SizedBox(width: 60,),
                        SmallText(text: '₹155.00'),
                      ],
                    )
                  ],
                ),
              ),
              decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow:const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1.0,
                        offset: Offset(0,1),
                        blurStyle: BlurStyle.solid
                    ),
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 3.0,
                        offset: Offset(0,0)
                    ),
                  ]
              ),
            ),
            SizedBox(height: 15.0,),
            //check out button
            GeneralButton(
              onPressed: (){
               setState(() {
                _gotoBillingPage=true;
               });
              },
              text: AppLocalizations.of(context).checkout,
              width: 230,
            ),
            SizedBox(height: 5.0,),
          ],
    ):BillingPage();
  }

  List<Widget> addedBooks(){
    List<Widget> widgets=[];
    var bookIds=Provider.of<MyCartData>(context).addedIndex;

    for(int i=0; i<bookIds.length; i++){
      widgets.add(
          GetBuilder<BookController>(
            builder: (bookController){
              int index=0;
              bookController.bookList.forEach((element) {
                if(element.id==bookIds[i]){
                  index=bookController.bookList.indexOf(element);
                }
              });
             int discount=bookController.bookList[index].discount!;
             int price=bookController.bookList[index].price!;
             int percentage=bookController.bookList[index].percentage!;
             bool stock=bookController.bookList[index].stock!;
             String category=bookController.bookList[index].category!;
             String name=bookController.bookList[index].name!;
             String imagePath=convertTo(bookController.bookList[index].images);
             return Container(
               margin: EdgeInsets.only(bottom: 5),
               padding: EdgeInsets.only(top: 15.0,bottom: 15.0,left: 20.0,right: 20.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     height: 110,
                     width:  80,
                     decoration: BoxDecoration(
                         image: DecorationImage(
                             fit: BoxFit.cover,
                             image: NetworkImage(
                                 imagePath
                             )
                         )
                     ),
                   ),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         BigText(text: name,size: 14,),
                         SizedBox(height: 5.0,),
                         SmallText(text: category),
                         SizedBox(height: 5.0,),
                         discount == 0 ? BigText(text: 'PRICE:₹' + formatNumber(price),size: 14,):
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             BigText(text: 'PRICE:₹' + formatNumber(price-discount),fontWeight: FontWeight.w700,size: 14,),
                             SizedBox(height: 5.0,),
                             Row(
                               children: [
                                 SmallText(text: 'M.R.P:',size: 14,),
                                 Text(
                                   '₹' + formatNumber(price),
                                   style: TextStyle(
                                       fontSize: 14,
                                       color: Colors.red,
                                       decoration: TextDecoration.lineThrough
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 5.0,),
                             BigText(text: 'SAVE:₹' + formatNumber(discount)+'('+percentage.toString()+'%)',
                               color: Color(0xff008000),
                               fontWeight: FontWeight.w700,
                               size: 14,
                             ),
                           ],
                         ),
                         SizedBox(height: 5.0,),
                         Row(
                           children: [
                             SmallText(text: 'QTY:'),
                             SmallText(text: stock?'In Stock':'Not In Stock',color: Color(0xff008000),),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Container(
                             width: 120,
                             child: IncreaseOrDecreaseButton(
                               orderAmount: Provider.of<MyCartData>(context).orderAmount[
                                 bookController.bookList[index].id].toString(),
                               increaseAmount: ()=>changeOrderAmount(
                                   context,bookController.bookList[index].id, true),
                               decreaseAmount: ()=>changeOrderAmount(
                                   context,bookController.bookList[index].id, false),
                             )
                         ),
                       ],
                     ),
                   ),
                   IconButton(
                     onPressed: (){
                       Provider.of<MyCartData>(context, listen: false).removeAtIndex(i);
                     },
                     icon: Icon(FontAwesomeIcons.xmark,size:16,color: Colors.blueGrey,
                     )
                   )
                 ],
               ),
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(5.0),
                   boxShadow:const [
                     BoxShadow(
                         color: Colors.black54,
                         blurRadius: 1.0,
                         offset: Offset(0,1),
                         blurStyle: BlurStyle.solid
                     ),
                     BoxShadow(
                         color: Color(0xffe8e8e8),
                         blurRadius: 3.0,
                         offset: Offset(0,0)
                     ),
                   ]
               ),
             );
            }
           )
      );
    }
    return widgets;
  }
}
