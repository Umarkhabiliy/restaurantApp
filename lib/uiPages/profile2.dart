import 'package:calebrestaurant/uiPages/cart_page.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'My Profile',
                size: 24,
                fontweight: FontWeight.w400,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Personal details',
                  ),
                  TextWidget(
                    text: 'change',
                    color: orangee,
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 16),
                          child: Image.asset(
                            'assets/Images/dol.png',
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget(
                                text: "Thelma Sara-bear",
                                fontweight: FontWeight.w600,
                                size: 17,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget(
                                text: 'thelma_sara_bear@gmail.com',
                                color: manatee,
                                size: 12,
                              ),
                            ),
                            Divider(color: manatee),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget(
                                  text: "+233541138989",
                                  size: 12,
                                  color: manatee),
                            ),
                            Divider(color: manatee),
                            TextWidget(
                              text: "Trasco hotel,behind navarongo campus",
                              size: 12,
                              color: manatee,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Orders",
                          fontweight: FontWeight.w400,
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, size: 18)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Pending reviews",
                        fontweight: FontWeight.w400,
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Faq",
                        fontweight: FontWeight.w400,
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Help",
                        fontweight: FontWeight.w400,
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              AppButton(
                  widthh: 343,
                  heightt: 60,
                  backgraoundColors: orangee,
                  borderRadiuss: 24,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  onTap: () {},
                  text: "Update",
                  textColor: subtileColor)
            ],
          ),
        ),
      ),
    );
  }
}
