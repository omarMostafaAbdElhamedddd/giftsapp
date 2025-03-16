
import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';

import '../../../litls/widgets/customText.dart';
class MerchantsView extends StatelessWidget {
  const MerchantsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomText(
                  text: 'MERCHANTS',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Transform.rotate(
                angle: 3.1416,
                child: ImageIcon(
                  AssetImage('assets/images/logout.png'),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomVerticalSizeBox(padding: .6,),
            CustomMerchantItem(image: 'mech1', text: 'Fashion',),
            CustomMerchantItem(image: 'mech2', text: 'Jeweleries',),
            CustomMerchantItem(image: 'mech3', text: 'Furniture',),
            CustomMerchantItem(image: 'mech', text: 'Groceries',),
            CustomMerchantItem(image: 'mech4', text: 'Home',),
            CustomMerchantItem(image: 'mech5', text: 'Electronics',),
            CustomMerchantItem(image: 'mech6', text: 'Travel',color: Colors.white,),
          ],
        ),
      ),

    );
  }
}


class CustomMerchantItem extends StatelessWidget {
  const CustomMerchantItem({super.key, required this.image ,required this.text,this.color = Colors.black});
  final String image;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight!*.1,
   margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/$image.png'),
          fit: BoxFit.cover
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          CustomText(
            color:  color,
            text: text,fontSize: 14,fontWeight: FontWeight.w400,),
        ],
      ),

    );
  }
}
