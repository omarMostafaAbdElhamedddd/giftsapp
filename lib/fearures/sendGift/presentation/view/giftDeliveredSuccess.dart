import 'package:flutter/material.dart';
import 'package:gifts/fearures/home/presentation/view/homeView.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';

import '../../../root/presentation/rootView.dart';

class GiftDelivedSuccess extends StatelessWidget {
  const GiftDelivedSuccess({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * .2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Color(0xff141414)),
              child: Column(
                children: [
                  CustomVerticalSizeBox(
                    padding: 7,
                  ),
                  ImageIcon(
                    AssetImage('assets/images/success.png'),
                    color: Colors.green,
                    size: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    maxLines: 2,
                    height: 1.4,
                    textAlign: TextAlign.center,
                    text: text,
                    color: Colors.white,
                  ),
                  CustomVerticalSizeBox(
                    padding: 2,
                  ),
                ],
              ),
            ),
          ),
          CustomVerticalSizeBox(),
          InkWell(
            onTap: (){
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => RootView(),
                ),
                    (route) => false,
              );

            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xff141414),
              ),
              child: CustomText(
                text: 'Home',
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          CustomText(
            text: 'Airogift',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
