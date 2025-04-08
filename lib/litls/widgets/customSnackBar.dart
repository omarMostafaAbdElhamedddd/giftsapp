

import 'package:flutter/material.dart';
import 'package:gifts/litls/widgets/customText.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor ?? Colors.black, // Default color
        content: CustomText(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          height: 1,
          text: message,
        )
      ),
    );
  }
}
