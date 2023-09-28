import 'package:flutter/cupertino.dart';

class MyCartData extends ChangeNotifier{
  List<String> _addedIndex=[];
  Map<String,int> _orderAmountOfEachBook= {};
  bool _isFilter = false;
  bool _isSort = false;
  bool _isFilterPrice = false;
  String _selectedSort = '';
  String _filterConditionCategory = '';
  String _filterConditionSubCategory = '';
  String _filterConditionAgeGroup = '';
  String _filterConditionLanguage = '';
  String _filterConditionPrice = '';

  String get filterConditionCategory{
    return _filterConditionCategory;
  }

  String get selectedSort{
    return _selectedSort;
  }

  void setSelectedSort(String value){
    _selectedSort=value;
    notifyListeners();
  }

  void setFilterConditionCategory(String value){
     _filterConditionCategory=value;
     notifyListeners();
  }

  String get filterConditionSubCategory{
    return _filterConditionSubCategory;
  }

  void setFilterConditionSubCategory(String value){
    _filterConditionSubCategory=value;
    notifyListeners();
  }

  String get filterConditionAgeGroup{
    return _filterConditionAgeGroup;
  }

  void setFilterConditionAgeGroup(String value){
    _filterConditionAgeGroup=value;
    notifyListeners();
  }

  String get filterConditionLanguage{
    return _filterConditionLanguage;
  }

  void setFilterConditionLanguage(String value){
    _filterConditionLanguage=value;
    notifyListeners();
  }

  String get filterConditionPrice{
    return _filterConditionPrice;
  }

  void setFilterConditionPrice(String value){
    _filterConditionPrice=value;
    notifyListeners();
  }

  bool get isFilter{
    return _isFilter;
  }

  void setFilter(bool value){
    _isFilter=value;
    notifyListeners();
  }

  bool get isFilterPrice{
    return _isFilterPrice;
  }

  void setFilterPrice(bool value){
    _isFilterPrice=value;
    notifyListeners();
  }

  bool get isSort{
    return _isSort;
  }

  void setSort(bool value){
    _isSort=value;
    notifyListeners();
  }

  List<String> get addedIndex{
    return _addedIndex;
  }

  Map<String,int> get orderAmount{
    return _orderAmountOfEachBook;
  }

  int get addedIndexCount {
    return _addedIndex.length;
  }

  void addIndex(String id){
    _addedIndex.add(id);
    _orderAmountOfEachBook[id]=1;
    notifyListeners();
  }

  void removeAtIndex(int index){
    _orderAmountOfEachBook.remove(_addedIndex[index]);
    _addedIndex.removeAt(index);
    notifyListeners();
  }

  void removeOfValue(String value){
    _orderAmountOfEachBook.remove(value);
    _addedIndex.remove(value);
    notifyListeners();
  }

  void changeOrderAmount(String key,int value){
    _orderAmountOfEachBook[key]=value;
    notifyListeners();
  }

}
