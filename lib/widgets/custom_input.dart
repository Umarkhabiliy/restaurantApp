import 'package:calebrestaurant/widgets/colors.dart';
import 'package:calebrestaurant/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AppInputText extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? title;
  final bool? enable;
  const AppInputText({this.title, this.controller, this.hint, this.enable});

  @override
  _AppInputTextState createState() => _AppInputTextState();
}

class _AppInputTextState extends State<AppInputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.title!,
          color: black_05,
          size: 15,
          fontweight: FontWeight.w600,
          textAlign: TextAlign.start,
        ),
        TextFormField(
          //enabled: widget.enable,
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ),
      ],
    );
  }
}
