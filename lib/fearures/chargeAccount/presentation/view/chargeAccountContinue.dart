import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/chargeAccount/presentation/manager/cubit.dart';
import 'package:gifts/fearures/chargeAccount/presentation/manager/states.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';

import '../../../../litls/widgets/customButton.dart';
import '../../../../litls/widgets/customText.dart';
import '../../../sendGift/presentation/view/giftDeliveredSuccess.dart';

class ChargeAccountContinue extends StatefulWidget {
  const ChargeAccountContinue({super.key, required this.balance});
  final double balance;

  @override
  State<ChargeAccountContinue> createState() => _ChargeAccountContinueState();
}

class _ChargeAccountContinueState extends State<ChargeAccountContinue> {

  final TextEditingController balanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                      CustomText(text: '${widget.balance}\$' ,color:Colors.white,fontWeight: FontWeight.w600,),
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
                          textAlign: TextAlign.center,

                          controller: balanceController,
                          style: TextStyle(
                            fontFamily: mainFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
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


                BlocProvider(
                    create: (context) => ChargeAccountCubit(
                        CharageAccountService()),
                    child: BlocConsumer<
                        ChargeAccountCubit,
                        ChargeAccountStates>(
                      builder: (context, state) {
                        if (state is InitStateChargeAccount ||
                            state is FailureStateChargeAccount ||
                            state is SuccessStateChargeAccount) {
                          return    CustomButton(text: 'CHARGE', onTap: (){
                            FocusScope.of(context).unfocus();
                            context.read<ChargeAccountCubit>().charageAccount(balance: balanceController.text);

                          },);


                        } else
                        if (state is LoadingStateChargeAccount) {
                          return SpinKitThreeBounce(
                            size: 30,
                            color: Colors.white,
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                      listener: (context, state) {
                        if (state is SuccessStateChargeAccount) {
                          Navigator.push(context,
                              PageRouteBuilder(
                                  pageBuilder: (context, an,
                                      sc) {
                                    return GiftDelivedSuccess(text: 'ACCOUNT \n CHARGED',);
                                  }));
                        } else
                        if (state is FailureStateChargeAccount) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                              showCloseIcon: true,
                              closeIconColor: Colors.white,
                              behavior: SnackBarBehavior
                                  .floating,
                              content: CustomText(
                                text: state.errorMessage,
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )));
                        }
                      },
                    )),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
