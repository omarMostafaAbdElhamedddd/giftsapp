import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';
import '../../../../../litls/widgets/customText.dart';


class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {

  List<bool> lanugaesStatus =[
    true,
    false,
    false,
  ];
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
              CustomVerticalSizeBox(padding: .4,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
                        fontWeight: FontWeight.w600,
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
                onTap: (){
                  if(!lanugaesStatus[0]){
                    lanugaesStatus[0]=true;
                    lanugaesStatus[1]=false;
                    lanugaesStatus[2]=false;
                    setState(() {

                    });
                  }
                },
                selected: lanugaesStatus[0],
                lanaguageText: 'English',),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomLangaugeItem(
                  onTap: (){
                    if(!lanugaesStatus[1]){
                      lanugaesStatus[0]=false;
                      lanugaesStatus[1]=true;
                      lanugaesStatus[2]=false;
                      setState(() {

                      });
                    }
                  },
                  lanaguageText: 'Arabic',
                  selected: lanugaesStatus[1],

                ),
              ),
              CustomLangaugeItem(
                onTap: (){
                  if(!lanugaesStatus[2]){
                    lanugaesStatus[0]=false;
                    lanugaesStatus[1]=false;
                    lanugaesStatus[2]=true;
                    setState(() {

                    });
                  }
                },
                lanaguageText: 'French',
                selected: lanugaesStatus[2],

              ),

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
  const CustomLangaugeItem({super.key, required this.lanaguageText , this.selected=false, this.onTap});
  final String lanaguageText;
  final bool selected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
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
      ),
    );
  }
}
