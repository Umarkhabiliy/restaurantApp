import 'package:calebrestaurant/main.dart';
import 'package:calebrestaurant/zoom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  FirebaseAuth? _auth;
  User? user;
  bool? isChecked;
  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    user = _auth!.currentUser;
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isChecked!
        ? Scaffold(
            body: Center(
            child: CupertinoActivityIndicator(),
          ))
        : user != null
            ? Zooom()
            : EntrencePage();
  }
}
