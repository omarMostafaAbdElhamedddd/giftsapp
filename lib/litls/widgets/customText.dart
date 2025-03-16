

import 'package:flutter/material.dart';
import 'package:gifts/litls/consts.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.color =const Color(0xff1E1E1E), this.fontSize =14,this.letterSpacing=.5,this.height=1.3 , this.fontWeight = FontWeight.w400 ,this.fontFamily =mainFont, this.textAlign=TextAlign.start, this.maxLines = 1, this.decoration});

  final String text;
  final Color color;
  final TextAlign textAlign ;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily ;
  final TextDecoration? decoration;
  final double height ;
  final int? maxLines ;
  final double letterSpacing ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        letterSpacing:letterSpacing,
        height: height,
        decoration: decoration,
        overflow: TextOverflow.ellipsis,
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,

      ),
    );
  }
}