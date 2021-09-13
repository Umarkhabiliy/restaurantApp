import 'package:calebrestaurant/onboarding_pages/login_screen.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';

import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sunset_orange,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 75,
                    height: 75,
                    child: Image.asset("assets/icons/bell.png"),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextWidget(
                  size: 65,
                  color: Colors.white,
                  text: "Food for Everyone",
                  fontweight: FontWeight.w800,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/Images/toyface_right.png",
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/Images/toyface_left.png",
              height: MediaQuery.of(context).size.height * 0.55,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[orange_10, vermilion_100],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: AppButton(
              widthh: 343,heightt: 60,
              text: "Get Started",
              backgraoundColors: Colors.white,
              textColor: orangee,
              borderRadiuss: 30,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
} 