import 'package:calebrestaurant/uiPages/checkout_page.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class CartPage extends StatefulWidget {
  int? index;
  CartPage({Key? key, this.index}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count2 = 1;
  int count = 1;
  SlidableController _slidableController = SlidableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder<QuerySnapshot>(
            stream: firebaseFirestore.collection('delivery').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QueryDocumentSnapshot<Object?>> listhelper = [];
                for (var i = 0; i < snapshot.data!.docs.length; i++) {
                  if (snapshot.data!.docs[i].id.toString().split(" ")[0] ==
                      FirebaseAuth.instance.currentUser!.email.toString()) {
                    listhelper.add(snapshot.data!.docs[i]);
                  }
                }
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Images/finger.png",
                          scale: 3,
                        ),
                        SizedBox(width: 5),
                        Text("swipe on an item to delete")
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                          itemCount: listhelper.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Slidable(
                              controller: _slidableController,
                              key: Key("$index"),
                              actionPane: SlidableDrawerActionPane(),
                              actions: [
                                IconSlideAction(
                                  color: Colors.transparent,
                                  iconWidget: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 25,
                                      child: Icon(
                                        CupertinoIcons.delete,
                                        color: Colors.white,
                                      )),
                                  onTap: () async {
                                    String myID = listhelper[
                                            listhelper.length - 1 - index]
                                        .id;
                                    print("BUUU IDDDD!!!! $myID");
                                    await firebaseFirestore
                                        .collection("delivery")
                                        .doc(myID)
                                        .delete();
                                  },
                                ),
                                IconSlideAction(
                                  color: Colors.transparent,
                                  iconWidget: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                              secondaryActions: [
                                IconSlideAction(
                                  iconWidget: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.greenAccent,
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Colors.white,
                                      )),
                                  color: Colors.transparent,
                                ),
                                IconSlideAction(
                                  color: Colors.transparent,
                                  iconWidget: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.greenAccent,
                                      child: Icon(
                                        CupertinoIcons.bookmark,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  width: double.infinity,
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: 0,
                                          top: 16,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.network(
                                              listhelper[listhelper.length -
                                                  1 -
                                                  index]['image'],
                                              fit: BoxFit.cover,
                                              scale: 8,
                                            ),
                                          )),
                                      Positioned(
                                          top: 28,
                                          left: 118,
                                          child: TextWidget(
                                            text: listhelper[listhelper.length -
                                                1 -
                                                index]['name'],
                                            size: 17,
                                          )),
                                      Positioned(
                                        top: 60,
                                        left: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              text: "GHs " +
                                                  listhelper[listhelper.length -
                                                          1 -
                                                          index]['price']
                                                      .toString() +
                                                  ".0",
                                              color: vermilion_100,
                                            ),
                                            SizedBox(width: 60),
                                            Container(
                                              width: 65,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: orangee),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (count > 1) {
                                                            count--;
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        child: TextWidget(
                                                          text: "-",
                                                          color: concrete,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    child: TextWidget(
                                                      text: count.toString(),
                                                      color: concrete,
                                                    ),
                                                  )),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          count += 1;
                                                        });
                                                      },
                                                      child: TextWidget(
                                                        text: "+",
                                                        color: concrete,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                );
              } else {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            }),
      ),
      floatingActionButton: AppButton(
        backgraoundColors: orangee,
        borderRadiuss: 20,
        widthh: 343,
        heightt: 60,
        text: "Complete order",
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckOutPage())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future deleteInfo() async {
    await firebaseFirestore
        .collection('delevry')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .delete();
  }
}
