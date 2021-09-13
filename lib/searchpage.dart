import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  List list1 = [];
  List list1narx = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('orders').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
        if (!snap.hasData) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80.0,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 17.0,
                ),
              ),
              title: Container(
                width: 250.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (e) {
                      var lista = [];
                      var listanarx = [];
                      for (var i = 0; i < snap.data!.docs.length; i++) {
                        lista.add([
                          snap.data!.docs[i]["name1"],
                          " " + snap.data!.docs[i]["name2"]
                        ]);
                        listanarx.add(snap.data!.docs[i]["number"]);
                      }
                      var listsearch2 = lista;
                      var listsearch2narx = listanarx;

                      setState(() {
                        if (e.toString().length == 0 && e.isEmpty) {
                          list1 = listsearch2;
                          list1narx = listsearch2narx;
                        } else {
                          List list2 = [];
                          List<String> list2narx = [];
                          for (var i = 0; i < listsearch2.length; i++) {
                            if ((listsearch2[i][0] + " " + listsearch2[i][1])
                                .toString()
                                .toLowerCase()
                                .contains(e.toString().toLowerCase())) {
                              list2.add(listsearch2[i]);
                              list2narx.add(listsearch2narx[i]);
                            }
                          }
                          list1 = list2;
                          list1narx = list2narx;
                        }
                      });
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.black12)),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: list1.length != 0
                    ? Column(
                        children: [
                          SizedBox(height: 35.0),
                          Text(
                            "Found " + (list1.length).toString() + " results",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.only(top: 30.0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.758,
                              ),
                              itemCount: list1.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 200,
                                    height: 380.0,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0,
                                                left: 18.0,
                                                right: 10.0),
                                            child: Container(
                                              width: 160.0,
                                              height: 250.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 42.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Image.network(
                                            snap.data!.docs[index]['image'],
                                            height: 185.0,
                                            width: 185.0,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 20.0,
                                          left: 46.0,
                                          child: Container(
                                            height: 80,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        list1[index][0],
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                      Text(
                                                        list1[index][1],
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  list1narx[index],
                                                  style: GoogleFonts.actor(
                                                    color: Colors.red,
                                                    fontSize: 12.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Container(
                          height: 400,
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),
                              Container(
                                height: 70.0,
                                child: Image.asset("assets/Images/search.png"),
                              ),
                              SizedBox(height: 35.0),
                              Text(
                                "Item not found",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Try searching the item with\na different keyword.",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          );
        }
      },
    );
  }
}
