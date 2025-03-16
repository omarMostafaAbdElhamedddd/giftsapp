import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gifts/litls/widgets/customText.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: 'Airogift',
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w800,
    );
  }
}
