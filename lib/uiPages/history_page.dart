import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "History",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Image.asset(
              "assets/Images/list.png",
              scale: 4,
              color: Color.fromRGBO(199, 199, 199, 1),
            ),
            SizedBox(
              height: 38,
            ),
            Text(
              "No history yet",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 18,
            ),
            Text("Hit the orange button down\nbelow to Create an order"),
            SizedBox(height: 120),
           AppButton(
              widthh: 343,
              heightt: 56,
              backgraoundColors: orangee,
              borderRadiuss: 25,
              onTap: () {},
              text: "Start Ordering",
            ),
          ],
        ),
      ),
    );
  }
}