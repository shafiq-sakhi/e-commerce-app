import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controllers/book_controllers.dart';
import 'package:e_commerce_app/utilities/global_functions.dart';
import 'package:e_commerce_app/utilities/mycart_data.dart';
import 'package:e_commerce_app/widgets/add_to_mycart_button.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/increase_or_decrease_button.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BookDescriptionPage extends StatefulWidget {
  final bookId;

  BookDescriptionPage({Key? key, this.bookId}) : super(key: key);

  @override
  State<BookDescriptionPage> createState() => _BookDescriptionPageState();

}

class _BookDescriptionPageState extends State<BookDescriptionPage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
        builder: (bookController){
          int index=0;
          bookController.bookList.forEach((element) {
            if(element.id==widget.bookId){
              index=bookController.bookList.indexOf(element);
            }
          });
          print(index);
          int discount=bookController.bookList[index].discount!;
          int price=bookController.bookList[index].price!;
          int percentage=bookController.bookList[index].percentage!;
          bool stock=bookController.bookList[index].stock!;
          String description=bookController.bookList[index].description!;
          String imagePath=convertTo(bookController.bookList[index].images);
          List images=bookController.bookList[index].images;
          return Column(
            children: [
              //image section
              images.length>1?CarouselSlider.builder(
                options: CarouselOptions(
                  height: 450,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2),
                ),
                itemCount: images.length,
                itemBuilder: (context,index,realIndex){
                  String image=images[index];
                  return Container(
                    margin: EdgeInsets.only(top: 25, bottom: 10,left: 15,right: 15),
                    width: double.maxFinite,
                    child: Image.network(
                        image,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ):
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 10,left: 30,right: 30),
                height: 450,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imagePath!='' ? NetworkImage(imagePath):
                        AssetImage('assets/image/alphabet1.jpg') as ImageProvider
                    )
                ),
              ),
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 20, bottom: 10,left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: bookController.bookList[index].name!),
                    SizedBox(height: 5.0,),
                    // if it offer any discount
                    discount == 0 ? BigText(text: 'PRICE:₹' + formatNumber(price)):
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: 'PRICE:₹' + formatNumber(price-discount),fontWeight: FontWeight.w600,),
                          SizedBox(height: 5.0,),
                          Expanded(
                            child: Row(
                              children: [
                                SmallText(text: 'M.R.P:',size: 16,),
                                Text(
                                  '₹' + formatNumber(price),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          BigText(text: 'SAVE:₹' + formatNumber(discount)+'('+percentage.toString()+'%)',
                            color: Color(0xff008000),
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: [
                        SmallText(text: 'QTY:'),
                        SmallText(text: stock?'In Stock':'Not In Stock',color: Color(0xff008000),),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    //button
                    Provider.of<MyCartData>(context).addedIndex.contains(widget.bookId) ?
                    Container(
                      width: 120,
                      child: IncreaseOrDecreaseButton(
                        orderAmount: Provider.of<MyCartData>(context).orderAmount[widget.bookId].toString(),
                        increaseAmount: ()=>changeOrderAmount(
                            context,widget.bookId, true),
                        decreaseAmount: ()=>changeOrderAmount(
                            context,widget.bookId, false),
                      ),
                    ):
                    AddToMyCartButton(onPressed: ()=> addToMyCart(context,widget.bookId)),
                    SizedBox(height: 5.0,),
                    SmallText(text: 'Product description'),
                    SmallText(
                        textAlign: TextAlign.start,
                        height: 1.5,
                        text:  description
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ],
          );
        }
    );
  }

}
