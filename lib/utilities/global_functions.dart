import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'mycart_data.dart';

String formatNumber(int number){
  return number.toStringAsFixed(2);
}

String convertTo(list){
  return list!= null?list[0]:'';
}

addToMyCart(BuildContext context,String id){
  Provider.of<MyCartData>(context,listen: false).addIndex(id);
}

changeOrderAmount(BuildContext context,String key,bool isIncrease){
  int? oldValue=Provider.of<MyCartData>(context, listen: false).orderAmount[key];
  if(!isIncrease && oldValue==1){
    Provider.of<MyCartData>(context, listen: false).removeOfValue(key);
  }else{
    Provider.of<MyCartData>(context,listen: false).changeOrderAmount(
        key, isIncrease ? oldValue!+1: oldValue!-1 );
  }
}

