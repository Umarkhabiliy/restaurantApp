import 'package:calebrestaurant/uiPages/favorite_page.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CheckOutPage2 extends StatefulWidget {
  @override
  _CheckOutPage2State createState() => _CheckOutPage2State();
}

class _CheckOutPage2State extends State<CheckOutPage2> {
  String pay = "Card";
  String pay1 = "Card1";
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 34.0,
                      fontWeight: FontWeight.w400),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit_outlined,
                        size: 20.0, color: Colors.black))
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(
              "Adress details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile(
                      value: "Card",
                      groupValue: pay,
                      onChanged: (String? sel) {
                        setState(() {
                          pay = sel!;
                        });
                      },
                      title: Row(
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFF47B0A),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(Icons.payment,
                                color: Colors.white, size: 20.0),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Card",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1),
                    RadioListTile(
                      value: "Mobile",
                      groupValue: pay,
                      onChanged: (String? sel) {
                        setState(() {
                          pay = sel!;
                        });
                      },
                      title: Row(
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFEB4796),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                                child: Icon(
                              Icons.account_balance,
                              color: Colors.white,
                              size: 20.0,
                            )),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Mobile Money (MTN)",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              width: 343.0,
              // margin: EdgeInsets.only(left: 30.0, top: 15.0),
              height: 167.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: TextWidget(
              text: "Delivery method.",
              fontweight: FontWeight.w400,
              size: 17,
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile(
                        activeColor: orangee,
                        value: "Card1",
                        groupValue: pay1,
                        onChanged: (String? sel) {
                          setState(() {
                            pay1 = sel!;
                          });
                        },
                        title: TextWidget(
                          text: "Door delivery",
                          size: 17,
                          fontweight: FontWeight.w400,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 20.0),
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                    RadioListTile(
                        activeColor: orangee,
                        value: "Mobile",
                        groupValue: pay1,
                        onChanged: (String? sel) {
                          setState(() {
                            pay1 = sel!;
                          });
                        },
                        title: Text(
                          "Pick up",
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ),
              width: 323.0,
              // margin: EdgeInsets.only(left: 51.0),
              height: 156.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Total",
                  fontweight: FontWeight.w400,
                  size: 17,
                ),
                TextWidget(
                  text: "23,000",
                  fontweight: FontWeight.w400,
                  size: 22,
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
            child: AppButton(
              widthh: 343,
              heightt: 60,
              backgraoundColors: orangee,
              borderRadiuss: 25,
              text: 'Proceed to payment',
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  titlePadding: EdgeInsets.all(0),
                  contentPadding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  title: Container(
                      decoration: BoxDecoration(
                          color: concrete,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      height: 60.0,
                      width: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0, top: 18.0),
                        child: Text(
                          'Please note',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      )),
                  content: Container(
                    width: 60,
                    height: 160.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18.0),
                          TextWidget(
                            text: "Delivery to trasco",
                            fontweight: FontWeight.w400,
                            color: silver,
                            size: 17,
                          ),
                          TextWidget(
                            text: "GHS 2 - GH 3",
                            size: 17.0,
                            fontweight: FontWeight.w400,
                          ),
                          SizedBox(height: 10.0),
                          Divider(thickness: 1),
                          SizedBox(height: 10.0),
                          TextWidget(
                            text: "Delivery to campus",
                            size: 15.0,
                            fontweight: FontWeight.w400,
                            color: silver,
                          ),
                          TextWidget(
                            text: "GHS 1",
                            size: 17.0,
                            fontweight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          borderRadiuss: 25,
                          text: "Cancel",
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          widthh: 120,
                          textColor: black_90,
                          backgraoundColors: Colors.transparent,
                          heightt: 60,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        AppButton(
                            borderRadiuss: 25,
                            text: "Proceed",
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            widthh: 120,
                            
                            backgraoundColors: orangee,
                            heightt: 60,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => FavoritePage()))),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 10.0),
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //         primary: Color.fromRGBO(250, 74, 12, 1),
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(30.0)),
                        //         fixedSize: Size(159.0, 70.0)),
                        //     onPressed: () {
                        //       Navigator.of(context).push(MaterialPageRoute(
                        //           builder: (context) => FavoritePage()));
                        //     },
                        //     child: Text(
                        //       "Proceed",
                        //       style: TextStyle(
                        //           fontSize: 17.0,
                        //           fontWeight: FontWeight.w600,
                        //           color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 45.0, top: 25.0),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         fixedSize: Size(314.0, 70.0),
          //         primary: Color(0xFFFA4A0C),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30),
          //         )),
          //     onPressed: () =>
          //     child: Text(
          //       "Process to payment",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 15,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
