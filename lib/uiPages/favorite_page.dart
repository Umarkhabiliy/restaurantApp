import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  // const FavoritePage({Key? key}) : super(key: key);
  var list1 = [];

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Orders",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: widget.list1.length == 0
            ? Center(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Image.asset(
                      "assets/Images/cart.png",
                      scale: 4,
                      color: Color.fromRGBO(199, 199, 199, 1),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Text(
                      "No orders yet",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 84.0),
                      child: TextWidget(
                          text:
                              "Hit the orange button down below to Create an order"),
                    ),
                    SizedBox(height: 200),
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
              )
            : StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid.toString()).snapshots(),
                builder: (context, snap) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("orders")
                          .snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemCount: widget.list1.length,
                            itemBuilder: (context, index) {
                              if (widget.list1[index] == 1) {
                                return Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data!.docs[index]['image']),
                                    ),
                                    title: TextWidget(
                                      text: snapshot.data!.docs[index]['name'],
                                    ),
                                    subtitle: TextWidget(
                                      text: snapshot.data!.docs[index]['price'],
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            });
                      });
                }));
  }
}
