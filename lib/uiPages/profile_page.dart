import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String pay = "Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 17.0,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Information",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/Images/dol.png",
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Thelma Sara-bear",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "thelma_sara-bear@gmail.com",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black12),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Trasaco hotel,behind navrongo\ncampus",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black12,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
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
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Card",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 70.0, right: 20.0),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
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
                                width: 35.0,
                                height: 35.0,
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
                                "Mobile Money (MTN,VODA)",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 70.0, right: 20.0),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        RadioListTile(
                          value: "Delivery",
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
                                    color: Color(0xFF0038FF),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.paypal,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Pay on delivery",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Update Information"),
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size(314, 70),
            primary: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}