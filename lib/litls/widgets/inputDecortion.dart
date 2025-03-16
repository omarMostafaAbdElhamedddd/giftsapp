import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gifts/litls/widgets/customText.dart';

InputDecoration buildInputDecoration(
    {required String hintText,
    bool fill = false,
    Color fillColor = Colors.white,
    Widget? suffixIcon,
    Widget? prefixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Colors.grey.withOpacity(0.5),
    hintText: hintText,
    hintStyle: TextStyle(
        fontWeight: FontWeight.w400, fontSize: 13, color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
  );
}

class CustomInboxItem extends StatelessWidget {
  const CustomInboxItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade200,
            child: Image.asset('assets/images/user.png'),
          ),
      SizedBox(width: 16,),
          CustomText(
            text: 'Mohamed charaf',
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.grey.withOpacity(.5)),
            child: CustomText(
              text: 'Remove',
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
