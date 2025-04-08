import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/sendGiftCubit.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/sendGiftStates.dart';
import 'package:gifts/fearures/sendGift/presentation/view/giftDeliveredSuccess.dart';
import 'package:gifts/litls/widgets/customButton.dart';
import '../../../../litls/responsiveSize.dart';
import '../../../../litls/widgets/customText.dart';
import 'giftSendSuccessAndShare.dart';

class GiftDetilsView extends StatelessWidget {
  const GiftDetilsView(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.phone,
      this.photoOrThumbnail,
      required this.ContactName,
      required this.content,
      required this.contactId,
      required this.email,
      required this.gift_id});

  final String name;
  final String image;
  final double price;
  final String ContactName;
  final String phone;
  final photoOrThumbnail;
  final String content;
  final String contactId;
  final String email;
  final int gift_id;

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
                            photoOrThumbnail != null
                                ? CircleAvatar(
                                    backgroundImage:
                                        MemoryImage(photoOrThumbnail!),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: CustomText(
                                      text: ContactName[0],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: ContactName,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                CustomText(
                                  text: phone,
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ],
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
                            const SizedBox(
                              width: 20,
                            ),
                            const CustomText(
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
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200)),
                child: Column(
                  children: [
                    Image.network(
                      image,
                      height: SizeConfig.screenHeight! * .17,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return SpinKitThreeBounce(
                            color: Colors.black,
                            size: 30,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: name,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomText(
                        text: content,
                        color: Colors.grey,
                        maxLines: 6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomText(
                      fontSize: 17,
                      text: '${price}\$',
                      color: Color(0xff00BFFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              CustomVerticalSizeBox(
                padding: .8,
              ),
              BlocProvider(
                  create: (context) => SendGiftCubit(SendGiftService()),
                  child: BlocConsumer<SendGiftCubit, SendGiftStates>(
                    builder: (context, state) {
                      if (state is InitStateSendGift ||
                          state is FailureStateSendGift ||
                          state is SuccessStateSendGift) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<SendGiftCubit>()
                                .createOrder(orderData: {
                              "name": ContactName,
                              "email": email,
                              "phone": phone,
                              "amount": price.toString(),
                              "bank": 'CIB',
                              "sender_id": '2',
                              "receiver_id": contactId,
                              "gift_id": gift_id.toString(),
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth! * .2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black),
                            child: Center(
                                child: CustomText(
                              fontWeight: FontWeight.w600,
                              text: 'Send gift',
                              color: Colors.white,
                            )),
                          ),
                        );
                      } else if (state is LoadingStateSendGift) {
                        return SpinKitThreeBounce(
                          size: 30,
                          color: Colors.black,
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                    listener: (context, state) {
                      if (state is SuccessStateSendGift) {
                        Navigator.push(context,
                            PageRouteBuilder(pageBuilder: (context, an, sc) {
                          return GiftDelivedSuccess(
                            text: 'GIFT\n DELIVERED',
                          );
                        }));
                      } else if (state is FailureStateSendGift) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            showCloseIcon: true,
                            closeIconColor: Colors.white,
                            behavior: SnackBarBehavior.floating,
                            content: CustomText(
                              text: state.message,
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )));
                      }
                    },
                  )),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
