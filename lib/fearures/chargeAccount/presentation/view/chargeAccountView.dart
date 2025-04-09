import 'package:flutter/material.dart';
import 'package:gifts/fearures/chargeAccount/presentation/view/chargeAccountContinue.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';

class ChargeAccountView extends StatelessWidget {
  const ChargeAccountView({super.key, required this.balance});
 final double balance;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context ,'refresh');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context ,'refresh');
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
                CustomVerticalSizeBox(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                      return ChargeAccountContinue(balance: balance,);
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                       Container(
                         height: 20,
                         width: 20,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(color: Colors.white , width: 2)
                         ),
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
                ),
               SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                      return ChargeAccountContinue(balance: balance,);
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white , width: 2)
                          ),
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
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                      return ChargeAccountContinue(balance: balance,);
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white , width: 2)
                          ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
