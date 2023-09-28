import 'package:e_commerce_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function onTap;

  const BottomNavigationWidget({
    Key? key, required this.icon, this.size=22, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ()=> onTap(),
        icon: Icon(
          icon,
          color: kPrimaryColor,
          size: size,
        )
    );
  }
}
