import 'package:calebrestaurant/check_page.dart/check_page.dart';
import 'package:calebrestaurant/onboarding_pages/onboarding_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CheckPage());
  }
}

class EntrencePage extends StatefulWidget {
  EntrencePage({Key? key}) : super(key: key);

  @override
  _EntrencePageState createState() => _EntrencePageState();
}

class _EntrencePageState extends State<EntrencePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(),
    );
  }
}
