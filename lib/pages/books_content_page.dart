import 'package:e_commerce_app/controllers/book_controllers.dart';
import 'package:e_commerce_app/pages/book_descriptions_page.dart';
import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/utilities/global_functions.dart';
import 'package:e_commerce_app/utilities/mycart_data.dart';
import 'package:e_commerce_app/widgets/add_to_mycart_button.dart';
import 'package:e_commerce_app/widgets/increase_or_decrease_button.dart';
import 'package:e_commerce_app/widgets/page_content_widget.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'sort_and_filter_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BooksContentPage extends StatefulWidget {
  const BooksContentPage({Key? key}) : super(key: key);

  @override
  State<BooksContentPage> createState() => BooksContentPageState();
}

class BooksContentPageState extends State<BooksContentPage> {
  List<int> evenIndex=[];
  List<int> oddIndex=[];
  bool _gotoBookDescription=false;
  late int _selectedIndex;
  late String _selectedBookId;

  @override
  Widget build(BuildContext context) {
    return !_gotoBookDescription ? Column(
      children: [
        //sort and filter button
        Container(
          //padding: const EdgeInsets.only(top:15,left: 45,right: 45),
          height: 30,
          width: 180,
          child: FlatButton(
            color: Color(0xffd9d9d9),
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      )
                  ),
                  builder: (context)=> SortAndFilterPage()
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Icon(Icons.sort,color: Colors.grey,)
                  ),
                  SizedBox(width: 5,),
                  SmallText(text: AppLocalizations.of(context).sortAndFilter,
                    size: 14,
                  ),
                  SizedBox(width: 5,),
                  Icon(Icons.keyboard_arrow_down,color: Colors.grey,)
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        GetBuilder<BookController>(
            builder: (bookController){
              return bookController.isLoaded?Consumer<MyCartData>(
                builder: (context,myCartData,child){
                  //normal product list and filtered list
                  List<dynamic> l = myCartData.isFilterPrice ? bookController.bookList.where((element) {
                    return (filterPrice(myCartData.filterConditionPrice,0) <= element.price &&
                        filterPrice(myCartData.filterConditionPrice,1) > element.price);
                  }).toList() :
                  myCartData.isFilter ? bookController.bookList.where((element){
                    return element.category == myCartData.filterConditionCategory ||
                           element.subcategory == myCartData.filterConditionSubCategory ||
                           element.ageGroup == myCartData.filterConditionAgeGroup ||
                           element.language == myCartData.filterConditionLanguage;
                  }).toList() : bookController.bookList;
                  increaseIndex(l.length);

                  if(myCartData.isSort){
                    if(myCartData.selectedSort=='Price'){
                      l.sort((a,b){
                        return a.price.compareTo(b.price);
                      });
                    }
                    if(myCartData.selectedSort=='Name'){
                      l.sort((a,b){
                        return a.name.compareTo(b.name);
                      });
                    }
                    if(myCartData.selectedSort=='Language'){
                      l.sort((a,b){
                        return a.language.compareTo(b.language);
                      });
                    }
                    if(myCartData.selectedSort=='Subcategory'){
                      l.sort((a,b){
                        return a.subcategory.compareTo(b.subcategory);
                      });
                    }
                  }

                  return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: l.length~/2 ,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PageContentWidget(
                                imagePath: convertTo(l[evenIndex[index]].images),
                                name: l[evenIndex[index]].name!,
                                price: l[evenIndex[index]].price!,
                                discount:  l[evenIndex[index]].discount!,
                                percentage: l[evenIndex[index]].percentage!,
                                onTap: (){
                                  setState(() {
                                    _selectedBookId=l[evenIndex[index]].id;
                                    _gotoBookDescription=true;
                                    _selectedIndex=evenIndex[index];
                                  });
                                },
                                addMyCartButton: myCartData.addedIndex.contains(l[evenIndex[index]].id) ?
                                IncreaseOrDecreaseButton(
                                    orderAmount: myCartData.orderAmount[l[evenIndex[index]].id].toString(),
                                    increaseAmount: ()=>changeOrderAmount(
                                        context,l[evenIndex[index]].id, true),
                                    decreaseAmount: ()=>changeOrderAmount(
                                        context,l[evenIndex[index]].id, false),
                                ):
                                AddToMyCartButton(onPressed: ()=> addToMyCart(context,l[evenIndex[index]].id))
                            ),
                            !oddIndex.isEmpty ? PageContentWidget(
                                imagePath: convertTo(l[oddIndex[index]].images),
                                name: l[oddIndex[index]].name!,
                                price: l[oddIndex[index]].price!,
                                discount:  l[oddIndex[index]].discount!,
                                percentage: l[oddIndex[index]].percentage!,
                                onTap: (){
                                  setState(() {
                                    _selectedBookId=l[oddIndex[index]].id;
                                    _gotoBookDescription=true;
                                  });
                                },
                                addMyCartButton: myCartData.addedIndex.contains(l[oddIndex[index]].id) ?
                                IncreaseOrDecreaseButton(
                                  orderAmount: myCartData.orderAmount[l[oddIndex[index]].id].toString(),
                                  increaseAmount: ()=>changeOrderAmount(
                                      context,l[oddIndex[index]].id, true),
                                  decreaseAmount: ()=>changeOrderAmount(
                                      context,l[oddIndex[index]].id, false),
                                ):
                                AddToMyCartButton(onPressed: ()=> addToMyCart(context,l[oddIndex[index]].id))
                            ):Container(),
                          ],
                        );
                      }
                  );
                }
              ):CircularProgressIndicator(
                color: kPrimaryColor,
              );
            }
        ),
      ],
    ) : BookDescriptionPage(bookId: _selectedBookId);
  }

  void increaseIndex(int indexLimit){
    print(indexLimit);
    for(int i=0; i<=indexLimit-2; i+=2){
      evenIndex.add(i);
      print("even index "+i.toString());
    }
    for(int i=1; i <= indexLimit-1; i+=2){
      oddIndex.add(i);
      print("odd index "+i.toString());
    }
  }
//Shafiq Sakhi is the best programmer in the world
   filterPrice(String value,int index) {
       List<String> prices = value.split('-');
       return int.parse(prices[index]);
   }

}