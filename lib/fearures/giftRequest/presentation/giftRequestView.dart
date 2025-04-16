import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/balance%20history/data/giftModelHistory.dart';
import 'package:gifts/fearures/giftRequest/presentation/manager/acceptCubit.dart';
import 'package:gifts/fearures/giftRequest/presentation/manager/acceptStates.dart';
import 'package:gifts/fearures/giftRequest/presentation/manager/rejectCubit.dart';
import 'package:gifts/fearures/giftRequest/presentation/manager/rejectStates.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:iconly/iconly.dart';

import '../../../litls/widgets/customSnackBar.dart';
import '../../../litls/widgets/customText.dart';

class GiftRequestView extends StatelessWidget {
  const GiftRequestView({super.key, required this.gifts});
 final List<GiftModelHistory> gifts;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context ,'refresh');
        return false;
      },
      child: Scaffold(
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
                    Navigator.pop(context ,'refresh');
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

            Expanded(child:
            gifts.length!=0 ?

            ListView.builder(
                itemCount: gifts.length,
                itemBuilder: (context, index) {
              return GiftRequestItem(giftModelHistory: gifts[index],);
            }) : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/noGift.png' , height: SizeConfig.screenHeight!*.1,),
                    CustomVerticalSizeBox(padding: .5,),
                  CustomText(text: 'You don’t have any new gifts',fontWeight: FontWeight.w600,),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class GiftRequestItem extends StatefulWidget {
  const GiftRequestItem({super.key, required this.giftModelHistory});
 final GiftModelHistory giftModelHistory;

  @override
  State<GiftRequestItem> createState() => _GiftRequestItemState();
}

class _GiftRequestItemState extends State<GiftRequestItem> {

  bool resultAccept = false;
  bool resultReject = false;

  bool acceptLoading = false;
  bool rejectLoading  = false;

  @override
  Widget build(BuildContext context) {
    return
      // GestureDetector(
      // onTap: () {
      //   showModalBottomSheet(
      //       backgroundColor: Colors.grey.shade200,
      //       isScrollControlled: true,
      //       useSafeArea: true,
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.only(
      //               topRight: Radius.circular(10),
      //               topLeft: Radius.circular(10))),
      //       context: context,
      //       builder: (context) {
      //         return RequestGiftDetailsView();
      //       });
      // },
      // child:
      Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: Colors.black , width: .1),
            color: Colors.grey.shade100),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black,)
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  IconlyLight.profile,
                  color: Colors.black,
                ),
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
                  text: widget.giftModelHistory.name,
                  color: Colors.black.withOpacity(.4),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 4,
                ),
                CustomText(
                  text: widget.giftModelHistory.phone,
                  color: Colors.grey,
                  fontSize: 12,
                ),
                SizedBox(
                  height: 4,
                ),
                CustomText(
                  text: 'Amount ${widget.giftModelHistory.amount}\$',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )
              ],
            )),

          !resultAccept && !resultReject ?   Row(
              children: [
               !rejectLoading ?  BlocProvider<AcceptCubit>(
                  create: (context) => AcceptCubit(AcceptService()),
                  child: BlocConsumer<AcceptCubit, AcceptStates>(
                    builder: (context, state) {
                      if(state is InitAcceptState || state is FailureAcceptState){
                        return   InkWell(
                          onTap: (){

                            context.read<AcceptCubit>().accept(id: widget.giftModelHistory.id.toString());

                          },
                          child:    Container(
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
                        );
                      } else if(state is LoadingAcceptState){
                        return SpinKitCircle(
                          size: 20,
                          color: Colors.black,);

                      }else{
                        return SizedBox();
                      }

                    },

                    listener: (context, state) async {

                      if (state is SucessAcceptState ) {
                        resultAccept = true;
                        setState(() {

                        });

                      } else if (state is FailureAcceptState) {
                          CustomSnackBar.show(context, state.message);
                      }else if( state is LoadingAcceptState){
                        acceptLoading = true;
                        setState(() {

                        });
                      }
                    },
                  ),
                ) : SizedBox(),

                SizedBox(
                  width: 20,
                ),

            !acceptLoading ?    BlocProvider<RejectCubit>(
                  create: (context) => RejectCubit(RejectService()),
                  child: BlocConsumer<RejectCubit, RejectStates>(
                    builder: (context, state) {
                      if(state is InitRejectState || state is FailureRejectState){
                        return   InkWell(
                          onTap: (){

                            context.read<RejectCubit>().reject(id: widget.giftModelHistory.id.toString());

                          },
                          child:       Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.red.withOpacity(.6),
                              size: 20,
                            ),
                          ),
                        );
                      } else if(state is LoadingRejectState){
                        return SpinKitCircle(
                          size: 20,
                          color: Colors.black,);

                      }else{
                        return SizedBox();
                      }

                    },

                    listener: (context, state) async {

                      if (state is SucessRejectState ) {
                        resultReject = true;
                        setState(() {

                        });

                      } else if (state is FailureRejectState) {
                        CustomSnackBar.show(context, state.message);
                      }else if(state is LoadingRejectState){
                        rejectLoading = true;
                        setState(() {

                        });
                      }
                    },
                  ),
                ) : SizedBox(),

              ],
            ) : resultReject ? CustomText(text: 'Rejected', color: Colors.red,fontWeight: FontWeight.w600,fontSize: 12,)
              :  CustomText(text: 'Accepted', color: Colors.green,fontWeight: FontWeight.w600,fontSize: 12,)
          ]
        ),
      // ),
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
