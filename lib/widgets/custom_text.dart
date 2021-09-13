import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? fontweight;
  final Color? color;
  final TextAlign? textAlign;
  const TextWidget(
      {this.text, this.color, this.size, this.fontweight, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontweight),
    );
  }
} 