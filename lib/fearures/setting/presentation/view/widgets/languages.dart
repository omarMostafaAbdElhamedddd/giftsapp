import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';

import '../../../../../litls/widgets/customText.dart';
class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(


            children: [

              CustomVerticalSizeBox(padding: .7,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomText(
                        text: 'Language',
                        color: Colors.white,
                        fontSize: 13,
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
              CustomVerticalSizeBox(padding: 1.2,),

              CustomLangaugeItem(
                selected: true,
                lanaguageText: 'English',),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomLangaugeItem(lanaguageText: 'Arabic',),
              ),
              CustomLangaugeItem(lanaguageText: 'French',),

              CustomVerticalSizeBox(padding: 1.2,),

              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!*.16, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff4C4C4C)),
                  child: CustomText(
                    text: 'Done',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLangaugeItem extends StatelessWidget {
  const CustomLangaugeItem({super.key, required this.lanaguageText , this.selected=false});
  final String lanaguageText;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14 , horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xff242424)
      ),

      child: Row(
        children: [
          CustomText(text: lanaguageText , color: Colors.white,),
         Spacer(),
          selected ? Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),

          ) : Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white,width: 2)
            ),
          ),

        ],
      ),
    );
  }
}
