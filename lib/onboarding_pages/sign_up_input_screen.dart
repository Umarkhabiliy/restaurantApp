
import 'package:calebrestaurant/onboarding_pages/login_screen.dart';
import 'package:calebrestaurant/uiPages/cart_page.dart';
import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_button.dart';
import 'package:calebrestaurant/widgets/custom_input.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class SignUpInputScreen extends StatefulWidget {
  @override
  _SignUpInputScreenState createState() => _SignUpInputScreenState();
}

class _SignUpInputScreenState extends State<SignUpInputScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 14),
                  child: AppInputText(
                    controller: emailController,
                    enable: true,
                    hint: "example@gmail.com",
                    title: "Email address",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14),
                  child: AppInputText(
                    controller: phoneController,
                    enable: true,
                    hint: "+99890000000",
                    title: "Phone Number",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14),
                  child: AppInputText(
                    controller: passwordController,
                    enable: true,
                    hint: "* * * * * * * *",
                    title: "Password ",
                  ),
                ),
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
                    onTap: _signUp,
                    text: "Register",
                    textColor: subtileColor)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signUp() async {
    try {
      if (_formKey.currentState!.validate()) {
        UserCredential _credential =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        User _newUser = _credential.user!;
        await _newUser.sendEmailVerification();
        if (_firebaseAuth.currentUser != null) {
          await _firebaseAuth.signOut();
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }
        await firebaseFirestore
            .collection('Users')
            .doc(_firebaseAuth.currentUser!.uid.toString())
            .set({
          'id': _firebaseAuth.currentUser!.uid.toString(),
          "email": _firebaseAuth.currentUser!.email.toString(),
          "likes":[2,2,2,2,2],
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
