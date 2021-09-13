

import 'package:calebrestaurant/searchpage.dart';
import 'package:calebrestaurant/uiPages/cart_page.dart';
import 'package:calebrestaurant/uiPages/detail_page.dart';
import 'package:calebrestaurant/uiPages/favorite_page.dart';
import 'package:calebrestaurant/uiPages/history_page.dart';
import 'package:calebrestaurant/uiPages/profile_page.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  ZoomDrawerController? zoomDrawerController;
  HomePage({this.zoomDrawerController});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    FavoritePage(),
    ProfilePage(),
    HistoryPage(),
  ];
  int selectedIndex = 0;
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (e) {
          if (e == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => FavoritePage()));
          } else if (e == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProfilePage()));
          } else if (e == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HistoryPage()));
          }
        },
        elevation: 0,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Personal"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                widget.zoomDrawerController!.open!();
                              },
                              icon: ImageIcon(AssetImage("assets/Images/Vector.png"))
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CartPage()));
                              },
                              icon: Icon(Icons.shopping_cart_rounded),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 100.0, top: 16),
                          child: TextWidget(
                            text: "Delicious food for you",
                            size: 34,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            height: 60,
                            child: TextFormField(
                              readOnly: true,
                              showCursor: true,
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage())),
                              // controller: widget.controller,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  fillColor:
                                      Colors.grey.shade300.withOpacity(0.4),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)))),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            // SizedBox(
                            //   width: 16,
                            // ),
                            TabBar(
                              isScrollable: true,
                              tabs: [
                                Tab(text: "Foods"),
                                Tab(text: "Drinks"),
                                Tab(text: "Snacks"),
                                Tab(text: "Sauce")
                              ],
                              labelColor: orangee,
                              labelStyle:
                                  TextStyle(color: orangee, fontSize: 17),
                              unselectedLabelStyle:
                                  TextStyle(color: orangee, fontSize: 17),
                              unselectedLabelColor: manatee,
                              indicatorColor: orangee,
                              controller: _tabController,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextWidget(
                                text: "see more",
                                color: orangee,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('orders')
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  height: 380,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(
                                                  parent:
                                                      BouncingScrollPhysics()),
                                          itemCount: snapshot.data.docs.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(
                                                                index: index)));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14.0,
                                                        vertical: 28),
                                                child: Container(
                                                  width: 220,
                                                  height: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        top: 40.0,
                                                        child: Container(
                                                          width: 200.0,
                                                          height: 240.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 140.0,
                                                        left: 0.0,
                                                        right: 20.0,
                                                        child: Image.network(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['image'],
                                                          height: 180.0,
                                                          width: 180.0,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 80.0,
                                                        left: 60.0,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              width: 120,
                                                              child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ["name"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22.0)),
                                                            ),
                                                            SizedBox(
                                                                height: 25.0),
                                                            Container(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            32.0),
                                                                child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ['price'],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          17.0),
                                                                ),
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
                                      ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(
                                                  parent:
                                                      BouncingScrollPhysics()),
                                          itemCount: snapshot.data.docs.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(
                                                                index: index)));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14.0,
                                                        vertical: 28),
                                                child: Container(
                                                  width: 220,
                                                  height: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        top: 40.0,
                                                        child: Container(
                                                          width: 200.0,
                                                          height: 240.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 140.0,
                                                        left: 0.0,
                                                        right: 20.0,
                                                        child: Image.network(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['image'],
                                                          height: 180.0,
                                                          width: 180.0,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 80.0,
                                                        left: 60.0,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              width: 120,
                                                              child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ["name"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22.0)),
                                                            ),
                                                            SizedBox(
                                                                height: 25.0),
                                                            Container(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            32.0),
                                                                child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ['price'],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          17.0),
                                                                ),
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
                                      ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(
                                                  parent:
                                                      BouncingScrollPhysics()),
                                          itemCount: snapshot.data.docs.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(
                                                                index: index)));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14.0,
                                                        vertical: 28),
                                                child: Container(
                                                  width: 220,
                                                  height: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        top: 40.0,
                                                        child: Container(
                                                          width: 200.0,
                                                          height: 240.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 140.0,
                                                        left: 0.0,
                                                        right: 20.0,
                                                        child: Image.network(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['image'],
                                                          height: 180.0,
                                                          width: 180.0,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 80.0,
                                                        left: 60.0,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              width: 120,
                                                              child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ["name"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22.0)),
                                                            ),
                                                            SizedBox(
                                                                height: 25.0),
                                                            Container(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            32.0),
                                                                child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ['price'],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          17.0),
                                                                ),
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
                                    ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(
                                                  parent:
                                                      BouncingScrollPhysics()),
                                          itemCount: snapshot.data.docs.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(
                                                                index: index)));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14.0,
                                                        vertical: 28),
                                                child: Container(
                                                  width: 220,
                                                  height: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        top: 40.0,
                                                        child: Container(
                                                          width: 200.0,
                                                          height: 240.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 140.0,
                                                        left: 0.0,
                                                        right: 20.0,
                                                        child: Image.network(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['image'],
                                                          height: 180.0,
                                                          width: 180.0,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 80.0,
                                                        left: 60.0,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              width: 120,
                                                              child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ["name"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22.0)),
                                                            ),
                                                            SizedBox(
                                                                height: 25.0),
                                                            Container(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            32.0),
                                                                child: Text(
                                                                  snapshot.data
                                                                              .docs[
                                                                          index]
                                                                      ['price'],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          17.0),
                                                                ),
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
                                    ],
                                  ),
                                );
                              } else {
                                return CupertinoActivityIndicator();
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
