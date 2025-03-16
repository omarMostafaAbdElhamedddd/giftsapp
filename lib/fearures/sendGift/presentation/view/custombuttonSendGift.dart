
import 'package:flutter/material.dart';

import '../../../../litls/widgets/customText.dart';

class CustomSendGiftImage extends StatelessWidget {
  const CustomSendGiftImage(
      {super.key, required this.widget, required this.text,  this.checkWidget =const SizedBox()});

  final Widget widget;
  final String text;
  final Widget checkWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          widget,
          SizedBox(
            width: 10,
          ),
          CustomText(
            text: text,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          Spacer(),
          checkWidget,
        ],
      ),
    );
  }
}
