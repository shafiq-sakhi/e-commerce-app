import 'package:e_commerce_app/utilities/constants.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/billing_textfield_widget.dart';
import 'package:e_commerce_app/widgets/number_container_widget.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({Key? key}) : super(key: key);

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  FocusNode _nameFocusNode=new FocusNode();
  FocusNode _emailFocusNode=new FocusNode();
  FocusNode _mobileFocusNode=new FocusNode();
  FocusNode _pincodeFocusNode=new FocusNode();
  FocusNode _cityFocusNode=new FocusNode();
  FocusNode _districtFocusNode=new FocusNode();
  FocusNode _stateFocusNode=new FocusNode();

  @override
  void initState() {
    super.initState();
    _nameFocusNode.addListener(() {setState(() {});});
    _emailFocusNode.addListener(() {setState(() {});});
    _mobileFocusNode.addListener(() {setState(() {});});
    _pincodeFocusNode.addListener(() {setState(() {});});
    _cityFocusNode.addListener(() {setState(() {});});
    _districtFocusNode.addListener(() {setState(() {});});
    _stateFocusNode.addListener(() {setState(() {});});
  }

  @override
  void dispose() {
    super.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _mobileFocusNode.dispose();
    _pincodeFocusNode.dispose();
    _cityFocusNode.dispose();
    _districtFocusNode.dispose();
    _stateFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.0,),
        Padding(
          padding:  EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: 'Amount',size: 20,),
              BigText(text: '₹155.00',size: 20,),
            ],
          ),
        ),
        SizedBox(height: 20.0,),
        //total description
        Container(
          height: 110,
          width: double.maxFinite,
          margin: EdgeInsets.only(left: 5,right: 5,bottom: 15),
          child: Padding(
            padding: EdgeInsets.only(top: 15,left: 15,bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SmallText(text: 'Total Amount',size: 15,),
                    SizedBox(width: 110,),
                    SmallText(text: '₹120.00'),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    SmallText(text: 'Delivery Charges(may vary by',size: 15,),
                    SizedBox(width: 10,),
                    SmallText(text: '₹35.00'),
                  ],
                ),
                SizedBox(height: 2,),
                SmallText(text: 'location)',size: 15,),
                SizedBox(height: 2,),
                Row(
                  children: [
                    BigText(text: 'Total Payable Amount',size: 15,),
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
        Row(
          children: [
            SizedBox(width: 20,),
            BigText(text: 'Billing',size: 20,),
          ],
        ),
        SizedBox(height: 15.0,),
        //billing section
        Container(
          constraints: BoxConstraints(
            maxHeight: double.infinity
          ),
          width: double.maxFinite,
          margin: EdgeInsets.only(left: 5,right: 5,bottom: 5.0),
          padding: EdgeInsets.only(left: 40,top: 40),
          child:Column(
            children: [
              //profile section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NumberContainerWidget(text: '1'),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      BigText(text: 'Profile',size: 14,fontWeight: FontWeight.w500,),
                      SizedBox(
                        height: 30,
                      ),
                      BillingTextFieldWidget(
                          focusNode: _nameFocusNode,
                          labelText: 'Name *',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BillingTextFieldWidget(
                        focusNode: _emailFocusNode,
                        labelText: 'Email *',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BillingTextFieldWidget(
                        focusNode: _mobileFocusNode,
                        labelText: 'Mobile *',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50,),
              //address section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NumberContainerWidget(text: '2'),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      BigText(text: 'Addresses',size: 14,fontWeight: FontWeight.w500,),
                      SizedBox(height: 30,),
                      BillingTextFieldWidget(
                        focusNode: _pincodeFocusNode,
                        labelText: 'Pincode *',
                      ),
                      SizedBox(height: 20,),
                      BillingTextFieldWidget(
                        focusNode: _cityFocusNode,
                        labelText: 'City *',
                      ),
                      SizedBox(height: 20,),
                      BillingTextFieldWidget(
                        focusNode: _districtFocusNode,
                        labelText: 'District *',
                      ),
                      SizedBox(height: 20,),
                      BillingTextFieldWidget(
                        focusNode: _stateFocusNode,
                        labelText: 'State *',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50,),
              //preview section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NumberContainerWidget(text: '2'),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      SizedBox(height: 5,),
                      BigText(text: 'Preview',size: 14,fontWeight: FontWeight.w500,),
                    ],
                  ),
                ],
              ),
            ],
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
        )
      ],
    );
  }
}
