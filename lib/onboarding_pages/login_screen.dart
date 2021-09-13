import 'package:calebrestaurant/onboarding_pages/sign_up_input_screen.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_input.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:calebrestaurant/zoom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF1F1F1),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child:
                          TabBarView(children: [login(), SignUpInputScreen()]),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.white,
                        spreadRadius: 3,
                      )
                    ],
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/Images/bell.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TabBar(
                          tabs: [Tab(text: "Login"), Tab(text: "Sign-Up")],
                          labelColor: Colors.black,
                          indicatorColor: orangee,
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
  }

  Widget login() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 42),
                child: AppInputText(
                  controller: emailController,
                  enable: true,
                  title: "Email address",
                  hint: "example@gmail.com",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 42),
                child: TextFormField(
                  cursorColor: subtileColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "*********",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: silver))),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(bottom: 42),
              //   child: AppInputText(
              //     controller: passwordController,
              //     enable: true,
              //     title: "Password",
              //     hint: "*********",
              //   ),
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 42),
                  child: TextWidget(
                    color: orangee,
                    size: 17,
                    text: "Forgot passcode?",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              AppButton(
                  widthh: 343,
                  heightt: 60,
                  backgraoundColors: orangee,
                  borderRadiuss: 24,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  onTap: signIn,
                  text: "Login",
                  textColor: subtileColor)
            ],
          ),
        ),
      ),
    );
  }

  signIn() async {
    try {
      if (_formKey.currentState!.validate()) {
        User _signInUser = (await _firebaseAuth.signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text))
            .user!;
        if (_signInUser.emailVerified) {
          await Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Zooom()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Verifild qiling")));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
