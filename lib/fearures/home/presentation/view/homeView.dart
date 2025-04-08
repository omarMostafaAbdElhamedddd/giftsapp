import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/auth/login/presentation/view/loginView.dart';
import 'dart:io';
import 'package:gifts/fearures/balance%20history/view/balance%20history.dart';
import 'package:gifts/fearures/chargeAccount/presentation/view/chargeAccountView.dart';
import 'package:gifts/fearures/comingEvents/presentation/manager/cubit.dart';
import 'package:gifts/fearures/comingEvents/presentation/view/comingEventsView.dart';
import 'package:gifts/fearures/giftRequest/presentation/giftRequestView.dart';
import 'package:gifts/fearures/home/presentation/manager/getUserInfoCubit.dart';
import 'package:gifts/fearures/home/presentation/manager/getUserInfoStates.dart';
import 'package:gifts/fearures/merchants/view/merchantView.dart';
import 'package:gifts/fearures/sendGift/presentation/view/sendGiftView.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:provider/provider.dart';
import '../../../../litls/widgets/check_internet_connection.dart';
import '../../../../litls/widgets/connected_to_internet.dart';
import '../../../createEvent/presentation/view/createEventView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<GetUseriInfoCbit>().getUserInfo();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final connectivityProvider = Provider.of<ConnectivityProvider>(context);
    return
        // connectivityProvider.isConnected ? connectivityProvider.hasInternetAccess ?

        BlocConsumer<GetUseriInfoCbit, GetUserInfoStates>(
            builder: (context, state) {
              if (state is LoadingStateGetUserInfo || state is InitStateGetUserInfo) {
                return    Scaffold(
                  body: Stack(
                    children: [

                      SizedBox(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight,
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
                          child: FadeInImage(
                            placeholder: AssetImage('assets/images/bachround.jpg',),
                            image: AssetImage('assets/images/bachround.jpg',),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  SpinKitThreeBounce(
                    color: Colors.white,
                    size: 30,
                  )

                    ],

                  ),

                );



              }
              else if (state is SuccessStateGetUserInfo) {
                return Scaffold(
                  body: Stack(
                    children: [

                      SizedBox(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight,
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
                          child: FadeInImage(
                            placeholder: AssetImage('assets/images/bachround.jpg',),
                            image: AssetImage('assets/images/bachround.jpg',),
                            fit: BoxFit.cover,
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
                                      padding: 1.8,
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: CustomText(
                                            text: 'Hello, ${state.userDataModel.name}',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Spacer(
                                          flex: 2,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                                            //   return SharePage();
                                            // }));
                                          },
                                          child: ImageIcon(
                                            AssetImage(
                                              'assets/images/person.png',
                                            ),
                                            color: Colors.white,
                                          ),
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
                                              text: '${state.userDataModel.friends}K',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: SizeConfig.screenWidth! * .05,
                                        ),

                                        Container(
                                          padding: EdgeInsets.all(0),
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white),
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                          ),
                                          child: ClipOval(
                                            child: state.userDataModel.image=='' ?  Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child:
                                              Image.asset('assets/images/user.png'),
                                            ) :    Image.network(
                                              'https://api.airogift.com/public/images/users/${state.userDataModel.image}',

                                              loadingBuilder: (context, child, loadingProgress) {
                                                if (loadingProgress == null) return child;
                                                return Container(
                                                  color: Colors.grey.shade200,
                                                );
                                              },
                                              errorBuilder: (context, error, stackTrace) {
                                                return Container(
                                                  color: Colors.grey.shade200,
                                                );
                                              },

                                               fit: BoxFit.cover,
                                            ),
                                          ),

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
                                              text: '${state.userDataModel.requests}',
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
                                      height: 20,
                                    ),
                                    CustomText(
                                      text: 'Your balance',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.screenWidth! * .05),
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                        child: CustomText(
                                          text: '\$${state.userDataModel.balance}',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    CustomVerticalSizeBox(
                                      padding: 1,
                                    ),
                                    Row(
                                      children: [
                                        CustomItem(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(
                                                pageBuilder: (context, an, sc) {
                                              return ChargeAccountView();
                                            }));
                                          },
                                          text: 'Charge account',
                                          widget: Icon(
                                            Icons.attach_money_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        CustomItem(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(
                                                pageBuilder: (context, an, sc) {
                                              return CreateEventView();
                                            }));
                                          },
                                          text: 'Create event',
                                          widget: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        CustomItem(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(
                                                pageBuilder: (context, an, sc) {
                                              return GiftRequestView();
                                            }));
                                          },
                                          text: 'Gift requests',
                                          widget: ImageIcon(
                                            AssetImage('assets/images/request.png'),
                                            color: Colors.white,
                                          ),
                                        ),
                                        CustomItem(
                                          text: 'Pay bill',
                                          widget: ImageIcon(
                                            AssetImage('assets/images/pay.png'),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 28,
                                    ),
                                    Row(
                                      children: [
                                        CustomItem(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(
                                                pageBuilder: (context, an, sc) {
                                              return SendGiftView(
                                                email: state.userDataModel.email,
                                              );
                                            }));
                                          },
                                          text: 'Send Gift ',
                                          widget: ImageIcon(
                                            AssetImage('assets/images/send.png'),
                                            color: Colors.white,
                                          ),
                                        ),
                                        CustomItem(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(
                                                pageBuilder: (context, an, sc) {
                                              return BalanceHistoryView();
                                            }));
                                          },
                                          text: 'Balance history',
                                          widget: ImageIcon(
                                            AssetImage('assets/images/balamce.png'),
                                            color: Colors.white,
                                          ),
                                        ),
                                        CustomItem(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(
                                                pageBuilder: (context, ac, sc) {
                                              return BlocProvider(
                                                create: (context) =>
                                                    GetEventsCubit(GetEventsService()),
                                                child: CommingEventsView(),
                                              );
                                            }));
                                          },
                                          text: 'Coming events',
                                          widget: ImageIcon(
                                            AssetImage('assets/images/come.png'),
                                            color: Colors.white,
                                          ),
                                        ),
                                        CustomItem(
                                          onTap: () {
                                            Navigator.push(context, PageRouteBuilder(
                                                pageBuilder: (context, an, sc) {
                                              return MerchantsView();
                                            }));
                                          },
                                          text: 'Merchants',
                                          widget: ImageIcon(
                                            AssetImage('assets/images/mer.png'),
                                            color: Colors.white,
                                          ),
                                        ),

                                      ],
                                    ),
                                    CustomVerticalSizeBox(
                                      padding: 1.2,
                                    ),
                                    Image.asset(
                                      'assets/images/home.png',
                                      height: SizeConfig.screenHeight! * .14,
                                    ),
                                    SizedBox(height: 20,),
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
              else if (state is FailureStateGetUserInfo) {
                if(state.statusCode==400){
                 return AlertDialog(
                   title: CustomText(text: "Session Expired",color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18,),
                   content: CustomText(
                     maxLines: 4,
                     text: "Your session has expired. Please log in again.",fontSize: 13,fontWeight: FontWeight.w500,),
                   actions: [
                     TextButton(
                       onPressed: () {
                         Navigator.of(context).pop();
                         // Navigate to login screen or perform logout
                         Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                           return LoginView();
                         }));
                       },
                       child: CustomText(text: 'Login',fontWeight: FontWeight.bold,color: Colors.black,)
                     ),
                   ],
                 );
                }
                else{
                  return   Scaffold(
                    body: Stack(
                      children: [

                        SizedBox(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight,
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
                            child: FadeInImage(
                              placeholder: AssetImage('assets/images/bachround.jpg',),
                              image: AssetImage('assets/images/bachround.jpg',),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CustomText(
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              height: 1.5,
                              text:state.statusCode==403 ? 'Please contact the administrator to activate your account' : state.message,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),

                      ],

                    ),

                  );
                }

              } else {
                return SizedBox();
              }
            },
            listener: (context, state) {})
        // : ConnectedToInternet(message: 'Conneted without internet')
        // : ConnectedToInternet(message: 'No internet connection');

        ;
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem(
      {super.key, required this.text, required this.widget, this.onTap});

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
              child: FittedBox(child: widget),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              textAlign: TextAlign.center,
              maxLines: 2,
              text: text,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 10,
            )
          ],
        ),
      ),
    );
  }
}
void showTokenExpiredDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Session Expired"),
        content: Text("Your session has expired. Please log in again."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to login screen or perform logout
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
