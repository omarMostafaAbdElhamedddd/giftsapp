
import 'package:flutter/material.dart';

import '../responsiveSize.dart';
import 'customText.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});

  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!*.2),
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Color(0xff4C4C4C), borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}