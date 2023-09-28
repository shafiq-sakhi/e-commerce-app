import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/utilities/mycart_data.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/general_button.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SortAndFilterPage extends StatefulWidget {
  const SortAndFilterPage({Key? key}) : super(key: key);

  @override
  State<SortAndFilterPage> createState() => _SortAndFilterPageState();
}

class _SortAndFilterPageState extends State<SortAndFilterPage> {
  bool _openSortBy = false;
  bool _openCategory = false;
  bool _openSubCategory = false;
  bool _openAgeGroup = false;
  bool _openLanguage = false;
  bool _openPrice = false;
  String _selected= "";
  String _selectedSort= "";
  bool _selectedCategory = false;
  bool _selectedSubCategory = false;
  bool _selectedAgeGroup = false;
  bool _selectedLanguage = false;
  bool _selectedPrice = false;
  
  void onChangedValueSort(String value){
    setState(() {
      _selectedSort=value;
    });
  }

  void onChangedValue(String value,String condition){
      setState(() {
        _selected=value;
        switch (condition) {
          case 'category':
            setSelectedToFalse();
            _selectedCategory = true;
            break;
          case 'subCategory':
            setSelectedToFalse();
            _selectedSubCategory = true;
            break;
          case 'ageGroup':
            setSelectedToFalse();
            _selectedAgeGroup = true;
            break;
          case 'language':
            setSelectedToFalse();
            _selectedLanguage = true;
            break;
          case 'price':
            setSelectedToFalse();
            _selectedPrice = true;
            break;
        }
      });
  }

  setSelectedToFalse(){
     _selectedCategory = false;
     _selectedSubCategory = false;
     _selectedAgeGroup = false;
     _selectedLanguage = false;
     _selectedPrice = false;
  }

  void setDropDownList(String condition){
    setState(() {
      switch (condition) {
        case 'sort':
          _openSortBy ? _openSortBy=false: _openSortBy=true;
          break;
        case 'category':
          _openCategory ? _openCategory=false: _openCategory=true;
          break;
        case 'subCategory':
          _openSubCategory ? _openSubCategory=false: _openSubCategory=true;
          break;
        case 'ageGroup':
          _openAgeGroup ? _openAgeGroup=false: _openAgeGroup=true;
          break;
        case 'language':
          _openLanguage ? _openLanguage=false: _openLanguage=true;
          break;
        case 'price':
          _openPrice ? _openPrice=false: _openPrice=true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ),
            BigText(text: AppLocalizations.of(context).sortAndFilter,size: 20,),
            SizedBox(height: 20,),

            //building a custom dropdown of sortBy
            buildDropDownList(AppLocalizations.of(context).sortBy,_openSortBy,()=>
                setDropDownList('sort')),
            _openSortBy ? setDropDownListOptions(sortOptions,
                (value){
                  onChangedValueSort(value);
                },_selectedSort
            ):Container(),

            //building a custom dropdown of category
            buildDropDownList(AppLocalizations.of(context).category,_openCategory,()=>
                setDropDownList('category')),
            _openCategory ? setDropDownListOptions(categoryOptions,(value){
              onChangedValue(value,'category');
            },_selected):Container(),

            //building a custom dropdown of subCategory
            buildDropDownList(AppLocalizations.of(context).subcategory,_openSubCategory,()=>
                setDropDownList('subCategory')),
            _openSubCategory ? setDropDownListOptions(subCategoryOptions,(value){
            onChangedValue(value,'subCategory');
            },_selected):Container(),

            //building a custom dropdown of age group
            buildDropDownList(AppLocalizations.of(context).ageGroup,_openAgeGroup,()=>
                setDropDownList('ageGroup')),
            _openAgeGroup ? setDropDownListOptions(ageGroupOptions,(value){
              onChangedValue(value,'ageGroup');
            },_selected):Container(),

            //building a custom dropdown of language
            buildDropDownList(AppLocalizations.of(context).language,_openLanguage,()=>
                setDropDownList('language')),
            _openLanguage ? setDropDownListOptions(languageOptions,(value){
              onChangedValue(value,'language');
            },_selected):Container(),

            buildDropDownList(AppLocalizations.of(context).price,_openPrice,()=>
                setDropDownList('price')),
            _openPrice ? setDropDownListOptions(priceOptions,(value){
              onChangedValue(value,'price');
            },_selected):Container(),

            SizedBox(height: 20,),
            GeneralButton(
              onPressed: (){
                if(_selected!=''){
                  Provider.of<MyCartData>(context,listen: false).setFilter(true);
                  Provider.of<MyCartData>(context,listen: false).setSort(false);
                }
                if(_selectedCategory) {
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionCategory(_selected);
                }else{
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionCategory('');
                }
                if(_selectedSubCategory) {
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionSubCategory(_selected);
                }else{
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionSubCategory('');
                }
                if(_selectedAgeGroup) {
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionAgeGroup(_selected);
                }else{
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionAgeGroup('');
                }
                if(_selectedLanguage) {
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionLanguage(_selected);
                }else{
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionLanguage('');
                }
                if(_selectedPrice) {
                  Provider.of<MyCartData>(context,listen: false).setFilterPrice(true);
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionPrice(_selected);
                }else{
                  Provider.of<MyCartData>(context,listen: false).setFilterConditionPrice('');
                  Provider.of<MyCartData>(context,listen: false).setFilterPrice(false);
                }

                if(_selectedSort!=''){
                  Provider.of<MyCartData>(context,listen: false).setSelectedSort(_selectedSort);
                  Provider.of<MyCartData>(context,listen: false).setSort(true);
                  Provider.of<MyCartData>(context,listen: false).setFilter(false);
                }

                Navigator.pop(context);
              },
              text: AppLocalizations.of(context).viewResult,
              width: 250,
              borderRadius: 20,
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  //general custom container for each custom dropdown list
  Container setDropDownListOptions(List<String> options,Function(dynamic value) onChanged,String groupValue) {
    return Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 10,left: 25),
              child: Column(
                children: makeRadio(options,onChanged,groupValue),
              )
          );
  }

  //general custom dropdownList
  GestureDetector buildDropDownList(String text,bool condition,Function onTap) {
    return GestureDetector(
          onTap: ()=> onTap(),
          child: Container(
            width: double.maxFinite,
            height: 55,
            margin: EdgeInsets.only(left: 15,right: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Colors.grey,)
              )
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: text,fontWeight: FontWeight.w500,),
                  condition? Icon(Icons.keyboard_arrow_up,color: Colors.black54,):
                  Icon(Icons.keyboard_arrow_down,color: Colors.black54,)
                ],
              ),
            ),
          ),
        );
  }

  List<Widget> makeRadio(List<String> names,Function(dynamic value) onChanged,String groupValue){
    List<Widget> list=<Widget>[];

    for(int i = 0; i<names.length; i++){
      list.add(Row(
        children: [
          Radio<String>(
            fillColor: MaterialStateColor.resolveWith((states) =>  kPrimaryColor.withOpacity(0.8)),
            value: names[i],
            onChanged: onChanged,
            groupValue: groupValue,
          ),
          SmallText(text: names[i]),
        ],
      ));
    }
    return list;
  }

}