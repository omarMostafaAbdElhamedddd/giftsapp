import 'package:flutter/material.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';

import '../../../../../litls/widgets/customText.dart';
import '../createEventView.dart';
class DesiredCachView extends StatefulWidget {
  const DesiredCachView({super.key});

  @override
  State<DesiredCachView> createState() => _DesiredCachViewState();
}

class _DesiredCachViewState extends State<DesiredCachView> {

  final TextEditingController controller1 = TextEditingController();
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
                  text: 'Desired cash',
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

      body: SafeArea(
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomVerticalSizeBox(padding: 3,),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CustomText(text: 'Desired gift' , color: Colors.white,),
                 ),

                TextFormField(
                  controller: controller1,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: mainFont
                  ),
                  keyboardType: TextInputType.number,
                  decoration: buildInputDecoration(
                      suffixIcon: Icon(Icons.attach_money_outlined , color: Colors.white,),
                      hintText: 'Enter desired gift'),
                ),

                CustomVerticalSizeBox(padding: 1,),

                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
                        return CreateEventView(status3: true,);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff4C4C4C)
                      ),
                      child: CustomText(text: 'Next',color: Colors.white,),
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}
