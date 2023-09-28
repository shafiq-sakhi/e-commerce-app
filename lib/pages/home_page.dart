import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/home_page_button.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 1),
          ),
          itemCount: bookCategoryImages.length,
          itemBuilder: (context,index,realIndex){
            String image=bookCategoryImages[index];
            return Container(
              margin: EdgeInsets.only(top: 5,left: 5,right: 5),
              width: double.maxFinite,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        Container(
          color: kPrimaryColor,
          child: Column(
            children: [
              //what's selling section
              Container(
                color: Colors.white,
                height: 350,
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                        child: BigText(text: AppLocalizations.of(context).whatIsSelling ,size: 20,)
                    ),
                    SizedBox(height: 10,),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            width: 130,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image/book_set1.jpg')
                              )
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: BigText(text: AppLocalizations.of(context).bookSet,fontWeight: FontWeight.w600,color: Colors.white,),
                            )
                          ),
                          SizedBox(width: 10,),
                          Container(
                              height: 200,
                              width: 200,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/image/coloring.jpg')
                                  )
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: BigText(text: AppLocalizations.of(context).colouring,fontWeight: FontWeight.w600,color: Colors.white,),
                              )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 110,
                              width: 110,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/image/cursive.jpg')
                                  )
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: BigText(text: AppLocalizations.of(context).cursiveWriting,fontWeight: FontWeight.w600,color: Colors.white,),
                              )
                          ),
                          SizedBox(width: 5,),
                          Container(
                              height: 110,
                              width: 110,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/image/grammar.jpg')
                                  )
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: BigText(text: AppLocalizations.of(context).grammarBook,fontWeight: FontWeight.w600,color: Colors.white,),
                              )
                          ),
                          SizedBox(width: 5,),
                          Container(
                              height: 110,
                              width: 110,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/image/hindi.jpg')
                                  )
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: BigText(text: AppLocalizations.of(context).hindiWriting,fontWeight: FontWeight.w600,color: Colors.white,),
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //first section
              HomePageContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: AppLocalizations.of(context).tagThinkAndGrow,
                      size: 23,
                      fontWeight: FontWeight.w600,
                      height: 0.8,
                    ),
                    SizedBox(height: 10,),
                    SmallText(
                      text: longText1,
                      textAlign: TextAlign.start,
                      height: 1.5,
                      size: 15,
                    ),
                    SizedBox(height: 15,),
                    BigText(
                      text: AppLocalizations.of(context).cursiveWriting,
                      size: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: SmallText(
                        text: longText2,
                        height: 1.5,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    BigText(
                      text: AppLocalizations.of(context).byTheEndOfTheir,
                      size: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: SmallText(
                        text: longText3,
                        height: 1.5,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    //shopNow button
                    HomePageButton(color: kLoginHeaderColor,),
                    SizedBox(height: 40,),
                    SmallText(
                      text: longText4,
                      height: 1.5,
                      size: 15,
                    ),
                    SizedBox(height: 15,),
                    BigText(
                      text: AppLocalizations.of(context).weWantToNurture,
                      size: 15,
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/book_set.png'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    HomePageButton(color: kPrimaryColor,)
                  ],
                ),
              ),
              //second section
              HomePageContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5,bottom: 10),
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/booksCategoryImage/first.jpg'),
                              fit: BoxFit.cover,
                          )
                      ),
                    ),
                    BigText(
                      text: AppLocalizations.of(context).tamilCopyWriting,
                      size: 23,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10,),
                    SmallText(
                      text: longText5,
                      height: 1.5,
                    ),
                    SizedBox(height: 5,),
                    HomePageButton(color: kLoginHeaderColor,),
                    SizedBox(height: 50,),
                    BigText(
                      text: AppLocalizations.of(context).handwriting,
                      size: 23,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5,),
                    SmallText(
                      text: longText6,
                      height: 1.5,
                      size: 15,
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.only(top: 5,bottom: 10),
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/booksCategoryImage/second.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    HomePageButton(color: kPrimaryColor,),
                    SizedBox(height: 20,),
                  ],
                )
              ),
              //third section
              HomePageContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(
                        text: AppLocalizations.of(context).colouringPractice,
                        size: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 3,),
                      SmallText(
                        text: longText7,
                        height: 1.5,
                        size: 15,
                      ),
                      SizedBox(height: 5,),
                      Container(
                        margin: EdgeInsets.only(top: 5,bottom: 10),
                        height: 70,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/booksCategoryImage/fourth.jpg'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      HomePageButton(color: kLoginHeaderColor,),
                      SizedBox(height: 50,),
                      Container(
                        margin: EdgeInsets.only(top: 5,bottom: 10),
                        height: 70,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/booksCategoryImage/third.jpg'),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: BigText(
                          text: AppLocalizations.of(context).origmai,
                          size: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5,),
                      SmallText(
                        text: AppLocalizations.of(context).theJapaneseArtOf,
                        height: 1.5,
                        size: 15,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: BigText(
                          text: AppLocalizations.of(context).benefitsOfPracticing,
                          height: 1.5,
                          size: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Divider(
                        height: 2.0,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15,),
                      BenifitText(AppLocalizations.of(context).manyAgeGroups),
                      BenifitText(AppLocalizations.of(context).helpsToUnderstand,),
                      BenifitText(AppLocalizations.of(context).improveCognitiveDevelopment,),
                      BenifitText(AppLocalizations.of(context).schematicLearning),
                      HomePageButton(color: kPrimaryColor,),
                      SizedBox(height: 20,),
                    ],
                  )
              ),
              //fourth section
              HomePageContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30,bottom: 10),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/free-shipping.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      BigText(
                        text: AppLocalizations.of(context).freeShipping,
                        size: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 5,),
                      SmallText(text: AppLocalizations.of(context).onOrderOver,color: Color(0xff8c8c8c),),
                      SizedBox(height: 15,),
                      SmallText(text: AppLocalizations.of(context).useCouponCode,),
                      SizedBox(height: 30,),
                      HomePageButton(color: kLoginHeaderColor,),
                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(top: 30,bottom: 10),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/cash_delivery.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      BigText(
                        text: AppLocalizations.of(context).cashOnDelivery,
                        size: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      BigText(
                        text: AppLocalizations.of(context).available,
                        size: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 5,),
                      SmallText(text: AppLocalizations.of(context).onOrderFrom,color: Color(0xff8c8c8c),),
                      SizedBox(height: 15,),
                      SmallText(text: AppLocalizations.of(context).additionalCod,height: 1.5,),
                      SmallText(text: AppLocalizations.of(context).useCouponCodeFreeCod,height: 1.5,),
                      SizedBox(height: 30,),
                      HomePageButton(color: kLoginHeaderColor,),
                      SizedBox(height: 30,),
                    ],
                  )
              ),
            ],
          ),
        )
      ],
    );
  }

  Padding BenifitText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SmallText(
        text: text,
        height: 1.6,
        size: 14,
        textAlign: TextAlign.start,
      ),
    );
  }
}

class HomePageContainer extends StatelessWidget {
  final Widget child;
  const HomePageContainer({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 25,right: 25),
      constraints: BoxConstraints(
        maxHeight: double.infinity
      ),
      child: Padding(
        padding: EdgeInsets.all(35),
        child: child
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white
      ),
    );
  }
}
