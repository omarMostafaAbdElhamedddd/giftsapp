import 'package:flutter/material.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';

import '../../../../litls/widgets/customText.dart';
import '../../../sendGift/presentation/view/giftDeliveredSuccess.dart';

class ChargeAccountContinue extends StatelessWidget {
  const ChargeAccountContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title:Padding(
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
                  text: 'Charge account',
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

      backgroundColor: Colors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomVerticalSizeBox(padding: .7,),
              Padding(
                padding: const EdgeInsets.only(left: 16 , right: 40),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/visa.png'),
                                fit: BoxFit.fill)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'CHASE BANK',
                              color: Colors.white,
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                CustomText(
                                  text: '1324  3245   3145   3245',
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: '3/27',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                Spacer(),
                                Image.asset('assets/images/visaIcon.png')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              CustomVerticalSizeBox(),
              
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Color(0xff232323),
                  borderRadius: BorderRadius.circular(7),

                ),
                child: Row(
                  children: [
                    CustomText(text: 'Account  balance',color: Colors.white,),
                    Spacer(),
                    CustomText(text: '314\$' ,color:Colors.white,fontWeight: FontWeight.w600,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Color(0xff232323),
                  borderRadius: BorderRadius.circular(7),

                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    CustomText(text: 'Add TO  balance(\$)',color: Colors.white,),
                    Spacer(),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: mainFont,
                          fontSize: 14,
                          color: Colors.white
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric( horizontal: 16),
                          fillColor: Color(0xff434343),
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          errorBorder: UnderlineInputBorder()
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            CustomVerticalSizeBox(padding: 1.2,),

              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus(); // إغلاق الكيبورد
                  Future.delayed(Duration(milliseconds: 100), () { // تأخير بسيط لضمان إغلاق الكيبورد قبل التنقل
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, an, sc) {
                          return GiftDelivedSuccess(text: 'ACCOUNT \n CHARGED',);
                        },
                      ),
                    );
                  });
                },

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                      color: Color(0xff434343)
                  ),
                  child: CustomText(text: 'CHARGE',color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
