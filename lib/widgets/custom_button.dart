import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final double? borderRadiuss;
  final Color? backgraoundColors;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;
  final double? widthh, heightt;
  AppButton(
      {this.text,
      this.fontSize,
      this.textColor,
      this.backgraoundColors,
      this.onTap,
      this.fontWeight,
      this.borderRadiuss,
      this.widthh,
      this.heightt});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(widthh!, heightt!),
          elevation: 0,
          primary: backgraoundColors,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiuss!))),
      onPressed: onTap,
      child: Text(
        text!,
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
    );
  }
}
