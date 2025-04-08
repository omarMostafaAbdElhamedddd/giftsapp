import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gifts/fearures/auth/forgetPassword/presentation/forgetPassword.dart';
import 'package:gifts/fearures/auth/signup/presentation/view/signupView.dart';
import 'package:gifts/fearures/home/presentation/view/homeView.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customButton.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';
import 'package:provider/provider.dart';

import '../../../../../litls/widgets/check_internet_connection.dart';
import '../../../../../litls/widgets/customSnackBar.dart';
import '../../../../../litls/widgets/logo.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpen = keyboardHeight > 0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                child: SizedBox(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  child: FadeInImage(
                    fadeInDuration: Duration(milliseconds: 100),
                    placeholder: AssetImage('assets/images/bachround.jpg'),
                    image: AssetImage('assets/images/bachround.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: isKeyboardOpen ? keyboardHeight : 0,
              // تعديل ارتفاع المحتوى
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                        CustomVerticalSizeBox(padding: 1),
                        Center(
                          child: CustomText(
                            text: 'Forget password',
                            fontWeight: FontWeight.w800,
                            fontFamily: mainFont,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        CustomVerticalSizeBox(padding: 1.3),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomText(
                            text: 'Eneter your email address',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            letterSpacing: .3,
                          ),
                        ),
                        SizedBox(height: 7,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (data) {
                              if (data!.isEmpty) {
                                return 'Please enter your email';
                              }
                            },
                            controller: emailcontroller,
                            style: customTextStyle,
                            cursorColor: Colors.black,
                            decoration: buildInputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 10,
                                        width: 17,
                                        child: Divider(
                                            thickness: 1, color: Colors.white)),
                                    SizedBox(
                                        height: 10,
                                        width: 26,
                                        child: Divider(
                                            thickness: 1, color: Colors.white))
                                  ],
                                ),
                              ),
                              hintText: 'Enter email address',
                              fillColor: Colors.grey.withOpacity(.5),
                            ),
                          ),
                        ),
                        CustomVerticalSizeBox(padding: 1,),
                        Center(child: CustomText(text: 'Continue', color: Colors.white,fontWeight: FontWeight.bold,)),
                        Column(
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),


                                  ],
                                ),
                                Spacer(flex: 4),

                                // BlocProvider<LoginCubit>(
                                //   create: (context) => LoginCubit(LoginService()),
                                //   child: BlocConsumer<LoginCubit, LoginStates>(
                                //     builder: (context, state) {
                                //       if(state is InitLoginState || state is FailureLoginState || state is SucessLoginState){
                                //         return   InkWell(
                                //           onTap: (){
                                //             if(formKey.currentState!.validate()){
                                //               context.read<LoginCubit>().login(username: emailcontroller.text, password: passwordcontroller.text);
                                //             }
                                //           },
                                //           child: CustomText(
                                //             text: 'Login',
                                //             fontSize: 13,
                                //             color: Colors.white,
                                //             fontWeight: FontWeight.w800,
                                //           ),
                                //         );
                                //       } else if(state is LoadingLoginState){
                                //         return SpinKitThreeBounce(
                                //           size: 20,
                                //           color: Colors.white,);
                                //       }else{
                                //         return SizedBox();
                                //       }
                                //
                                //     },
                                //
                                //     listener: (context, state) async {
                                //
                                //       if (state is SucessLoginState ) {
                                //         FocusScope.of(context).unfocus();
                                //         Navigator.push(context, PageRouteBuilder(
                                //             pageBuilder: (context, an, sc) {
                                //               return  RootView();
                                //             }));
                                //       } else if (state is FailureLoginState) {
                                //         if(state.statusCode==401){
                                //
                                //           CustomSnackBar.show(context, 'Email not found or incorrect password.');
                                //         } else{
                                //
                                //           CustomSnackBar.show(context, state.message);
                                //         }
                                //
                                //
                                //       }
                                //     },
                                //   ),
                                // ),

                                SizedBox(
                                  width: 10,
                                ),
                                Spacer(),
                              ],
                            ),
                            CustomVerticalSizeBox(
                              padding: 10,
                            ),
                            CustomLogo(),
                            CustomVerticalSizeBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TryView extends StatelessWidget {
  const TryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
