import 'package:flutter/material.dart';
import 'package:gifts/fearures/sendGift/presentation/view/giftDeliveredSuccess.dart';

import '../../../../litls/responsiveSize.dart';
import '../../../../litls/widgets/customText.dart';
import 'custombuttonSendGift.dart';

class GiftDetilsView extends StatelessWidget {
  const GiftDetilsView({super.key, required this.name, required this.image, required this.price});
 final String name;
 final String image;
 final double price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Padding(
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
                  text: 'Send gift',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomVerticalSizeBox(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff242424)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage('assets/images/user.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomText(
                              text: 'Mohamed charaf',
                              color: Colors.white,
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.green,
                              child: FittedBox(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff242424)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CustomText(
                              text: 'Amount of gift',
                              color: Colors.white,
                            ),
                            Spacer(),
                            CustomText(
                              text: '${price}\$',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      CustomVerticalSizeBox(
                        padding: .8,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200)
                ),
                child: Column(
                  children: [
                    Image.asset(image , height: SizeConfig.screenHeight!*.2,),
                    CustomText(text: name),
                    SizedBox(height: 5,),
                    CustomText(text: '${price}\$' , color: Colors.black,fontWeight: FontWeight.w600,),
                  ],
                ),
              ),
            CustomVerticalSizeBox(),
              // CustomSendGiftImage(
              //   checkWidget:    CircleAvatar(
              //     radius: 12,
              //     backgroundColor: Colors.green,
              //     child: FittedBox(
              //         child: Padding(
              //           padding: const EdgeInsets.all(4.0),
              //           child: Icon(
              //             Icons.check,
              //             color: Colors.white,
              //           ),
              //         )),
              //   ),
              //   widget: Icon(
              //     Icons.message,
              //     size: 25,
              //     color: Colors.white,
              //   ),
              //   text: 'Send Message',
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16),
              //   child: CustomSendGiftImage(
              //     checkWidget:    CircleAvatar(
              //       radius: 12,
              //       backgroundColor: Colors.green,
              //       child: FittedBox(
              //           child: Padding(
              //             padding: const EdgeInsets.all(4.0),
              //             child: Icon(
              //               Icons.check,
              //               color: Colors.white,
              //             ),
              //           )),
              //     ),
              //     widget: ImageIcon(
              //       AssetImage('assets/images/gallery.png'),
              //       size: 30,
              //       color: Colors.white,
              //     ),
              //     text: 'Upload photo',
              //   ),
              // ),
              // CustomSendGiftImage(
              //   widget: ImageIcon(
              //     AssetImage('assets/images/take image.png'),
              //     size: 30,
              //     color: Colors.white,
              //   ),
              //   text: 'Camra image',
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // CustomSendGiftImage(
              //   widget: Icon(
              //     Icons.play_circle_fill,
              //     color: Colors.white,
              //   ),
              //   text: 'Upload video',
              // ),
              // CustomVerticalSizeBox(
              //   padding: .8,
              // ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                    return GiftDelivedSuccess(text: 'GIFT\n DELIVERED',);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * .2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: Colors.black),
                  child: Center(
                      child: CustomText(
                    fontWeight: FontWeight.w600,
                    text: 'Send gift',
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
