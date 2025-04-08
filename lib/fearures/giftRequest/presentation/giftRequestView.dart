import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:iconly/iconly.dart';

import '../../../litls/widgets/customText.dart';

class GiftRequestView extends StatelessWidget {
  const GiftRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  text: 'Gift requests',
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
      body: Column(
        children: [
          // Divider(color: Colors.grey.shade500,),
          SizedBox(
            height: 10,
          ),

          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return GiftRequestItem();
          }))
        ],
      ),
    );
  }
}

class GiftRequestItem extends StatelessWidget {
  const GiftRequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.grey.shade200,
            isScrollControlled: true,
            useSafeArea: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            context: context,
            builder: (context) {
              return RequestGiftDetailsView();
            });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: Colors.black , width: .1),
            color: Colors.grey.shade200),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                IconlyLight.profile,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Omar mostafa',
                  color: Colors.black.withOpacity(.4),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 4,
                ),
                CustomText(
                  text: '+201030653634',
                  color: Colors.grey,
                  fontSize: 12,
                ),
                SizedBox(
                  height: 4,
                ),
                CustomText(
                  text: 'Amount 1000\$',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )
              ],
            )),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 20,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: Icon(
                Icons.close,
                color: Colors.red.withOpacity(.6),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestGiftDetailsView extends StatelessWidget {
  const RequestGiftDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )),
              Spacer(
                flex: 2,
              ),
              CustomText(
                text: 'Gift details',
                fontWeight: FontWeight.bold,
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: .2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'From',
                          fontSize: 17,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                          // border: Border.all(color: Colors.grey, width: .3),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    IconlyLight.profile,
                                    color: Colors.black,
                                  )),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: 'Omar Mostafa',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                      fontSize: 14,
                                      color: Colors.black,
                                      text: '+201030653634')
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/Ferrari.png',
                        height: SizeConfig.screenHeight! * .15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(text: 'gift name'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: '1000\$',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    CustomVerticalSizeBox(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                          child: CustomText(
                        text: 'Accept',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: CustomText(
                              text: 'Reject',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
