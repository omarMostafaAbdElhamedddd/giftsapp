
import 'package:flutter/material.dart';

import '../responsiveSize.dart';
import 'customText.dart';
import 'package:flutter/material.dart';

import '../responsiveSize.dart';
import 'customText.dart';

import 'package:flutter/material.dart';

import '../responsiveSize.dart';
import 'customText.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.text, this.onTap});

  final String text;
  final Function()? onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.2),
      child: Listener(
        onPointerDown: (_) => setState(() => _isPressed = true),
        onPointerUp: (_) => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _isPressed ? 0.97 : 1.0,
          duration: Duration(milliseconds: 100),
          child: Material(
            elevation: _isPressed ? 2 : 6,
            shadowColor: Colors.black.withOpacity(0.3),
            color: Color(0xff4C4C4C),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.white24,
              highlightColor: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: CustomText(
                    text: widget.text,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

