import 'package:calebrestaurant/uiPages/check_page_out.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';

import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String pay = "Card";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: Colors.black,
          ),
        ),
        title: TextWidget(
            text: "Checkout",
            color: black_90,
            fontweight: FontWeight.w400,
            size: 18),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:32.0),
                child: TextWidget(
                    text: "Delivery", size: 32, fontweight: FontWeight.w400),
              )),
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                    text: "Address details",
                    size: 17,
                    fontweight: FontWeight.w400),
                TextWidget(
                    text: "change",
                    color: orangee,
                    fontweight: FontWeight.w400),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Thelma Sara-bear",
                    fontweight: FontWeight.w600,
                    size: 17,
                  ),
                   SizedBox(height: 8),
                  Divider(color: silver,thickness: 1,),
                  TextWidget(
                    text: "Trasco hotel,behind navarongo campus",
                    size: 12,
                    color: manatee,
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: silver,
                    thickness: 1,
                  ),
                  TextWidget(text: "+233541138989", size: 12, color: manatee),
                ],
              ),
            ),
            width: 343.0,
            height: 156.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: TextWidget(
                text: "Delivery Method",
                size: 17,
                fontweight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                RadioListTile(
                    activeColor: orangee,
                    value: "Card",
                    groupValue: pay,
                    onChanged: (String? sel) {
                      setState(() {
                        pay = sel!;
                      });
                    },
                    title: TextWidget(
                      text: "Door delivery",
                      size: 17,
                      fontweight: FontWeight.w400,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 20.0),
                  child: Divider(thickness: 1),
                ),
                RadioListTile(
                  value: "Mobile",
                  groupValue: pay,
                  onChanged: (String? sel) {
                    setState(() {
                      pay = sel!;
                    });
                  },
                  title: TextWidget(
                    text: "Pick up",
                    size: 17,
                    fontweight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            width: 343.0,
            
            height: 156.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Total",
                  size: 17,
                ),
                TextWidget(
                  text: "+23354",
                  size: 16,
                  fontweight: FontWeight.w700,
                ),
              ],
            ),
          ),
        
          AppButton(
            widthh: 343,
            heightt: 60,
            backgraoundColors: orangee,
            borderRadiuss: 25,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CheckOutPage2()
            ),
            ),
            text: "Proceed to payment",
            textColor: concrete,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
