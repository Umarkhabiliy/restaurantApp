import 'package:calebrestaurant/uiPages/cart_page.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DetailScreen extends StatefulWidget {
  int? index;

  DetailScreen({this.index});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _pageController1 = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: firebaseFirestore.collection('orders').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              
                            ],
                          ),
                          Container(
                            height: 220,
                            child: PageView.builder(
                                itemCount: snapshot.data!.docs.length,
                                controller: _pageController1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        height: 220,
                                        child: Image.network(
                                          snapshot.data!.docs[widget.index!]
                                              ['image'],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                onPageChanged: (int index) {
                                  _currentPageNotifier.value = index;
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CirclePageIndicator(
                              selectedDotColor: orangee,
                              dotColor: Colors.grey.shade300,
                              itemCount: snapshot.data!.docs.length,
                              currentPageNotifier: _currentPageNotifier,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(16)),
                          TextWidget(
                            text: snapshot.data!.docs[widget.index!]['name'],
                            size: 28,
                            color: Colors.black,
                            //weight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                          TextWidget(
                            text: snapshot.data!.docs[widget.index!]['price'],
                            size: 22,
                            color: orangee,
                            //weight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.all(16)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                              text: "Delivery info",
                              size: 17,
                              color: Colors.black,
                              //weight: FontWeight.w600,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          TextWidget(
                            text:
                                "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                            size: 15,
                            color: black_50,
                            // weight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                          Padding(padding: EdgeInsets.all(16)),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget(
                              text: "Return policy",
                              size: 17,
                              color: Colors.black,
                              //weight: FontWeight.w600,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          TextWidget(
                            text:
                                "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                            size: 15,
                            color: black_50,
                            //  weight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 30),
                          AppButton(
                              widthh: 343,
                              heightt: 56,
                              backgraoundColors: orangee,
                              borderRadiuss: 25,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              onTap: () async {
                                await delivery(
                                  snapshot.data!.docs[widget.index!]['name'],
                                  double.parse(snapshot
                                          .data!.docs[widget.index!]['price']
                                          .toString()
                                          .split(" ")[1])
                                      .toInt(),
                                      snapshot.data!.docs[widget.index!]['image'],
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CartPage(index: widget.index!)));
                              },
                              text: "Add to cart",
                              textColor: subtileColor)
                        ],
                      );
                    } else {
                      return CupertinoActivityIndicator();
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Future delivery(name, int price,String img) async {
    int sumOfDelivery = price * 1;
    await firebaseFirestore
        .collection('delivery')
        .doc(FirebaseAuth.instance.currentUser!.email.toString() + " " + DateTime.now().toString())
        .set({
      'name': name,
      'price': sumOfDelivery,
      'numberOf': 1,
      "image": img,
      'time': DateTime.now(),
    }, SetOptions(merge: false));
  }
}
