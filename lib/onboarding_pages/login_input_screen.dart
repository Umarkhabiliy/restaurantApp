// import 'package:calebrestaurant/widgets/colors.dart';
// import 'package:calebrestaurant/widgets/custom_button.dart';
// import 'package:calebrestaurant/widgets/custom_input.dart';
// import 'package:calebrestaurant/widgets/custom_text.dart';
// import 'package:calebrestaurant/zoom_drawer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class LoginInputScreen extends StatefulWidget {
//   @override
//   _LoginInputScreenState createState() => _LoginInputScreenState();
// }

// class _LoginInputScreenState extends State<LoginInputScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   var _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 42),
//                   child: AppInputText(
//                     controller: emailController,
//                     enable: true,
//                     title: "Email address",
//                     hint: "example@gmail.com",
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 42),
//                   child: AppInputText(
//                     controller: passwordController,
//                     enable: true,
//                     title: "Password",
//                     hint: "*********",
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 42),
//                     child: TextWidget(
//                       color: orangee,
//                       size: 17,
//                       text: "Forgot passcode?",
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 ),
//                 AppButton(
//                     widthh: 343,
//                     heightt: 60,
//                     backgraoundColors: orangee,
//                     borderRadiuss: 24,
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                     onTap: signIn,
//                     text: "Jobs",
//                     textColor: subtileColor)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  
// }
