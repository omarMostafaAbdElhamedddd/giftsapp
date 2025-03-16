import 'package:flutter/material.dart';
import 'package:gifts/fearures/sendGift/presentation/view/giftDeliveredSuccess.dart';
import 'package:gifts/fearures/sendGift/presentation/view/giftDetails.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';
import 'package:iconly/iconly.dart';

import 'custombuttonSendGift.dart';

class AmountOfgiftView extends StatelessWidget {
  const AmountOfgiftView({super.key});

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
                      CustomVerticalSizeBox(padding: .6,),
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
                        height: 20,
                      ),
                      // CustomText(
                      //   text: 'Amount of gift',
                      //   color: Colors.white,
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   cursorColor: Colors.white,
                      //   style: TextStyle(color: Colors.white),
                      //   decoration: InputDecoration(
                      //       prefixIcon: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           CustomText(
                      //             text: '\$',
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w800,
                      //           ),
                      //         ],
                      //       ),
                      //       contentPadding: EdgeInsets.symmetric(
                      //           vertical: 10, horizontal: 16),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //           borderSide: BorderSide(color: Colors.white)),
                      //       enabledBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //           borderSide: BorderSide(color: Colors.white)),
                      //       focusedBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //           borderSide: BorderSide(color: Colors.white))),
                      // ),
                      // CustomVerticalSizeBox(
                      //   padding: .8,
                      // ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              // CustomSendGiftImage(
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
              //     widget: ImageIcon(
              //       AssetImage('assets/images/gallery.png'),
              //       size: 30,
              //       color: Colors.white,
              //     ),
              //     text: 'Upload photo',
              //   ),
              //
              //
              // ),
              // CustomSendGiftImage(
              //   widget: ImageIcon(
              //     AssetImage('assets/images/take image.png'),
              //     size: 30,
              //     color: Colors.white,
              //   ),
              //   text: 'Camra image',
              // ),
              // SizedBox(height: 16,),
              // CustomSendGiftImage(
              //   widget: Icon(
              //     Icons.play_circle_fill,
              //     color: Colors.white,
              //   ),
              //   text: 'Upload video',
              // ),
              // CustomVerticalSizeBox(padding: .8,),
              // GestureDetector(
              //   onTap: (){
              //     Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
              //       return GiftDetilsView();
              //     }));
              //   },
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 10),
              //     margin: EdgeInsets.symmetric(
              //         horizontal: SizeConfig.screenWidth! * .2),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5), color: Colors.black),
              //     child: Center(
              //         child: CustomText(
              //       fontWeight: FontWeight.w600,
              //       text: 'Send gift',
              //       color: Colors.white,
              //     )),
              //   ),
              // ),
              // SizedBox(height: 20,),

              ListOfGiftsWidget()
            ],
          ),
        ),
      ),
    );
  }
}


class ListOfGiftsWidget extends StatefulWidget {
  const ListOfGiftsWidget({super.key});

  @override
  State<ListOfGiftsWidget> createState() => _ListOfGiftsWidgetState();
}

class _ListOfGiftsWidgetState extends State<ListOfGiftsWidget> {
  List<String> imagesBestSellers = [
    'Maybach.png',
    'Lamborghini.png',
    'Range Rover.png',
    'Maybach.png',
    'Lamborghini.png',
    'Range Rover.png'
  ];

  List<String> namesBestSellers = [
    'Maybach',
    'Lamborghini',
    'Range Rover',
    'Maybach',
    'Lamborghini',
    'Range Rover'
  ];

  List<String> imagesBudgetFriendly = [
    'G Class.png',
    'Bugatti.png',
    'BMW.png',
    'G Class.png',
    'Bugatti.png',
    'BMW.png',
  ];

  List<String> namesBudgetFriendly = [
    'G Class',
    'Bugatti',
    'BMW',
    'G Class',
    'Bugatti',
    'BMW',
  ];
  List<String> imagesNewArrivals = [
    'Yacht.png',
    'Plane.png',
    'Ferrari.png',
    'balamce.png',
    'Plane.png',
    'Ferrari.png',

  ];

  List<String> namesNewArrivals = [
    'Yacht',
    'Plane',
    'Ferrari',
    'balamce',
    'Plane',
    'Ferrari',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 23, right: 16),
          child: Row(
            children: [
              CustomText(
                text: 'Best Sellers ',

                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              Spacer(),
              CustomText(
                text: 'View All',
                color: Color(0xffAEAEAE),

                fontWeight: FontWeight.w700,
                fontSize: 10,
              )
            ],
          ),
        ),
        SizedBox(height: 7,),
        SizedBox(
          height: SizeConfig.screenHeight! * .2,
          child: ListView.builder(
            itemCount: imagesBestSellers.length,
              padding: EdgeInsets.symmetric(horizontal: 17),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomFeaturedCoursesItem(image: 'assets/images/${imagesBestSellers[index]}', name: namesBestSellers[index],);
              }),
        ),
        SizedBox(height: 16,),

        Padding(
          padding: const EdgeInsets.only(left: 23, right: 16),
          child: Row(
            children: [
              CustomText(
                text: 'Budget Friendly',

                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              Spacer(),
              CustomText(
                text: 'View All',
                color: Color(0xffAEAEAE),

                fontWeight: FontWeight.w700,
                fontSize: 10,
              )
            ],
          ),
        ),
        SizedBox(height: 7,),
        SizedBox(
          height: SizeConfig.screenHeight! * .2,
          child: ListView.builder(
            itemCount: imagesBudgetFriendly.length,
              padding: EdgeInsets.symmetric(horizontal: 17),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomFeaturedCoursesItem(
                  price: 200,
                  image: 'assets/images/${imagesBudgetFriendly[index]}', name: namesBudgetFriendly[index],);
              }),
        ),
        SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.only(left: 23, right: 16),
          child: Row(
            children: [
              CustomText(
                text: 'New Arrivals',

                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              Spacer(),
              CustomText(
                text: 'View All',
                color: Color(0xffAEAEAE),

                fontWeight: FontWeight.w700,
                fontSize: 10,
              )
            ],
          ),
        ),
        SizedBox(height: 7,),
        SizedBox(
          height: SizeConfig.screenHeight! * .2,
          child: ListView.builder(
            itemCount: imagesNewArrivals.length,
              padding: EdgeInsets.symmetric(horizontal: 17),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomFeaturedCoursesItem(
                  price: 400,
                  image: 'assets/images/${imagesNewArrivals[index]}', name: namesNewArrivals[index],);
              }),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}

class CustomFeaturedCoursesItem extends StatelessWidget {
  const CustomFeaturedCoursesItem({super.key, required this.image , this.price=300, required this.name});
 final String image;
 final double price;
 final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
          return GiftDetilsView(image: image, name: name, price: price,);
        }));
      },
      child: Container(
        width: SizeConfig.screenWidth! * .4,
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.only(top: 8, left: 8, right: 12, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: [
                      Image.asset(
                      image,
                        width: SizeConfig.screenWidth! * .45,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.black,
                            ),
                          )),

                    ],
                  )),
            ),
            CustomText(
              maxLines: 2,
              textAlign: TextAlign.center,
              text: name,
              fontSize: 14,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  decoration: TextDecoration.lineThrough,
                  text: '${price}\$',
                  fontSize: 10,
                  color: Colors.grey,
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(width: 4,),
                CustomText(
                  text: '${price-50}\$',
                  fontSize: 14,
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}