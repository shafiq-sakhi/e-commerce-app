import 'package:e_commerce_app/widgets/bottom_navigation_widget.dart';
import 'package:e_commerce_app/widgets/special_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utilities/constants.dart';

class BottomNavigation extends StatefulWidget {
  final Function gotoMyOrder;
  final Function bottomScreen;
  final Function gotoMyCart;
  BottomNavigation({Key? key, required this.gotoMyOrder, required this.bottomScreen, required this.gotoMyCart}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>{
  TabController ?tabController;
  int selectedIndex = 0;
  onItemClicked(int index){
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50.0,right: 50.0),
      height: 55.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavigationWidget(
            onTap: ()=>widget.gotoMyCart(),
            icon: Icons.shopping_cart,
            size: 25,
          ),
          GestureDetector(
            onTap: ()=> widget.bottomScreen(),
              child: SpecialButtonWidget(
                icon: FontAwesomeIcons.solidSquarePlus,height: 55,width: 55,
              )
          ),
          BottomNavigationWidget(
            icon: Icons.menu,
            size: 25,
            onTap: ()=>widget.gotoMyOrder(),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: kBottomNavColor
      ),
    );
  }
}
