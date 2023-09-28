import 'package:e_commerce_app/pages/book_search_page.dart';
import 'package:e_commerce_app/pages/books_content_page.dart';
import 'package:e_commerce_app/pages/drawer_navigation_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/login_page.dart';
import 'package:e_commerce_app/pages/my_cart_page.dart';
import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/utilities/mycart_data.dart';
import 'package:e_commerce_app/widgets/number_container_widget.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation.dart';
import 'bottom_page.dart';
import 'my_order_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> _globalKey=GlobalKey();
  bool _gotoMyCart = false;
  bool _gotoMyOrder = false;
  bool _loginToPage = false;
  bool _gotoSearchPage = false;
  bool _homePage = true;

  backToPage(){
    setState(() {
      _gotoMyOrder=false;
      _gotoMyCart=false;
      _gotoSearchPage=false;
    });
    Provider.of<MyCartData>(context,listen: false).setFilter(false);
    Provider.of<MyCartData>(context,listen: false).setSort(false);
  }

  gotoHomePage(){
  setState(() {
    _homePage=true;
    _gotoMyOrder=false;
    _gotoMyCart=false;
    _gotoSearchPage=false;
  });
  }

  gotoMyOrder(){
    setState(() {
      if(_homePage){
        _homePage=false;
        _gotoMyOrder=true;
      }else{
      _gotoSearchPage=false;
      _gotoMyOrder=true;
      }
    });
  }

  gotoBooks(){
  setState(() {
    _homePage=false;
    _gotoMyOrder=false;
    _gotoMyCart=false;
    _gotoSearchPage=false;
  });
  Provider.of<MyCartData>(context,listen: false).setFilter(false);
  Provider.of<MyCartData>(context,listen: false).setSort(false);
  }

  gotoSearchPage(){
    setState(() {
      if(_homePage) {
        _homePage=false;
        _gotoSearchPage = true;
      }else{
        _gotoSearchPage=true;
      }
    });
  }

  gotoMyCart(){
    setState(() {
      if(_homePage){
        _homePage=false;
        _gotoMyCart=true;
      }else{
      _gotoMyOrder=false;
      _gotoSearchPage=false;
      _gotoMyCart=true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: DrawerNavigationPage(
        gotoHomePage: ()=> gotoHomePage(),
        gotoBooks: ()=> gotoBooks(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: ()=> gotoSearchPage(),
              child: Icon(Icons.search)
          ),
          SizedBox(width: 10,),
          Icon(Icons.whatsapp),
          SizedBox(width: 10,),
          //goto MyCart page
          GestureDetector(
            onTap: ()=> gotoMyCart(),
            child: Container(
              width: 35,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  Positioned(
                      top: 5,
                      right: 0,
                      left: 15,
                      child: NumberContainerWidget(
                        text: orderAmount(),
                        height: 20,
                        width: 20,
                        color: Colors.red,
                        size: 10,
                      )
                  )
                ],
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff00bcd4),
        title: Row(
          children: [
            GestureDetector(
              onTap: (){
                //global key to open drawer with button
                _globalKey.currentState?.openDrawer();
              },
                child: Icon(Icons.menu,color: Colors.white,)
            ),
            SizedBox(width: 5,),
            Text(
              AppLocalizations.of(context).subashreePublishers,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
            )
          ],
        ),
      ),

      body: !_loginToPage ? LoginPage(onPressed: (){setState(() {_loginToPage=true;});}):
      _homePage ? HomePage():
      SingleChildScrollView(
        child: Column(
          children: [
            //top listview filter options
            Container(
              padding: EdgeInsets.only(top: 15.0,left: 10.0),
              height: 95,
              //top bar options
              child: ListView.builder(
                itemCount: subCategoryOptions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      backToPage();
                      Provider.of<MyCartData>(context,listen: false).setFilter(true);
                      Provider.of<MyCartData>(context,listen: false).setSort(false);
                      Provider.of<MyCartData>(context,listen: false).setFilterConditionSubCategory(subCategoryOptions[index]);
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SmallText(text: subCategoryOptions[index],size: 12,),
                            SizedBox(height: 5,),
                            Container(
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(coverImages[index])
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.0,),
            //pages
            _gotoSearchPage? BookSearchPage():
            _gotoMyOrder ? MyOrderPage(onPressed: ()=> backToPage(),):
            _gotoMyCart ? MyCartPage(onPressed: ()=> backToPage(),) : BooksContentPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        gotoMyCart: ()=> gotoMyCart(),
        gotoMyOrder: ()=> gotoMyOrder(),
        bottomScreen: () {
         showModalBottomSheet(context: context, builder: (context)=> BottomPage());
        },
      ),
    );
  }

  String orderAmount(){
    int total=0;
    Provider.of<MyCartData>(context).orderAmount.forEach((key,value){
      total += value;
    });
    return total.toString();
  }

}




