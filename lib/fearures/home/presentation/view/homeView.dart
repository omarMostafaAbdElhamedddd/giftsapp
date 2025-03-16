import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gifts/fearures/balance%20history/view/balance%20history.dart';
import 'package:gifts/fearures/chargeAccount/presentation/view/chargeAccountView.dart';
import 'package:gifts/fearures/comingEvents/presentation/view/comingEventsView.dart';
import 'package:gifts/fearures/merchants/view/merchantView.dart';
import 'package:gifts/fearures/sendGift/presentation/view/sendGiftView.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../createEvent/presentation/view/createEventView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.86),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.7),
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.darken,
              child: Image.asset(
                'assets/images/bachround.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff4D4C4C),
                          Color(0xff4D4C4C),
                          Color(0xff4D4C4C),
                          Color(0xff4D4C4C),
                          Colors.grey.withOpacity(0.2),
                          Colors.grey.withOpacity(0.08),
                          Colors.grey.withOpacity(0.06),
                          Colors.grey.withOpacity(0.01),
                        ],
                      ).createShader(bounds);
                    },

                    child: Image.asset(
                      'assets/images/bachround.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        CustomVerticalSizeBox(
                          padding: 2.2,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomText(
                                text: 'Hello, Mohamed Charaf',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                            ImageIcon(
                              AssetImage(
                                'assets/images/person.png',
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ImageIcon(
                              AssetImage(
                                'assets/images/logout.png',
                              ),
                              color: Colors.white,
                            ),
                            Spacer(),
                          ],
                        ),
                        CustomVerticalSizeBox(
                          padding: .8,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                CustomText(
                                  text: 'Friends',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: '13K',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * .05,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 60,
                              backgroundImage: AssetImage('assets/images/user.png'),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * .05,
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: 'Requests',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: '314',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomText(
                          text: 'Your balance',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                        SizedBox(height: 4,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!*.05),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: CustomText(
                              text: '\$27,000.05',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        CustomVerticalSizeBox(padding: 1,),

                        Row(

                          children: [
                            CustomItem(
                              onTap: (){
                                Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                                  return ChargeAccountView();
                                }));
                              },
                              text: 'Charge account', widget:Icon(Icons.attach_money_sharp,color: Colors.white,),),
                            CustomItem(
                              onTap: (){
                                Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                                  return CreateEventView();
                                }));
                              },
                              text: 'Create event', widget: Icon(Icons.add ,color: Colors.white,),),
                            CustomItem(
                              onTap: (){
                                // Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                                //   return CreateEventView();
                                // }));
                              },
                              text: 'Gift requests', widget: ImageIcon(AssetImage('assets/images/request.png'),color: Colors.white,),),
                            CustomItem(text: 'Pay bill', widget: ImageIcon(AssetImage('assets/images/pay.png'),color: Colors.white,),),
                          ],
                        ),
                        SizedBox(height: 28,),
                        Row(

                          children: [
                            CustomItem(
                              onTap: (){
                                Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                                  return SendGiftView();
                                }));
                              },
                              text: 'Send Gift ', widget: ImageIcon(AssetImage('assets/images/send.png'),color: Colors.white,),),
                            CustomItem(
                              onTap: (){
                                Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                                  return BalanceHistoryView();
                                }));
                              },
                              text: 'Balance history', widget: ImageIcon(AssetImage('assets/images/balamce.png'),color: Colors.white,),),
                            CustomItem(
                              onTap: (){
                                Navigator.push(context,PageRouteBuilder(pageBuilder:(context,ac,sc){
                                  return CommingEventsView();
                                }));
                              },

                              text: 'Coming events', widget: ImageIcon(AssetImage('assets/images/come.png'),color: Colors.white,),),
                            CustomItem(
                              onTap: (){
                                Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                                  return MerchantsView();
                                }));
                              },

                              text: 'Merchants', widget: ImageIcon(AssetImage('assets/images/mer.png'),color: Colors.white,),),

                          ],
                        ),

                        CustomVerticalSizeBox(padding: 1.2,),
                        Image.asset('assets/images/home.png', height: SizeConfig.screenHeight!*.147,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.text, required this.widget, this.onTap});
  final String text;
  final Widget widget;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: FittedBox(
                  child: widget),
            ),
            SizedBox(height: 20,),
            CustomText(
              textAlign: TextAlign.center,
              maxLines: 2,
              text:text , color: Colors.white,fontWeight: FontWeight.w800,fontSize: 10,)
          ],
        ),
      ),
    );
  }
}
