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
import '../../../../root/presentation/rootView.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool passwordVisible = true;
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
                    placeholder: AssetImage( 'assets/images/bachround.jpg'),
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
              bottom: isKeyboardOpen ? keyboardHeight : 0, // تعديل ارتفاع المحتوى
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomVerticalSizeBox(padding: 3),
                        CustomText(
                          text: 'Login To Account',
                          fontWeight: FontWeight.w800,
                          fontFamily: mainFont,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        CustomVerticalSizeBox(padding: 1.3),
                        SizedBox(height: 20),


                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (data){
                              if(data!.isEmpty){
                                return 'Please enter your email';
                              }
                            },
                            controller: emailcontroller,
                            style: customTextStyle,
                            cursorColor: Colors.black,
                            decoration: buildInputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 16, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 10,
                                        width: 17,
                                        child: Divider(thickness: 1, color: Colors.white)),
                                    SizedBox(
                                        height: 10,
                                        width: 26,
                                        child: Divider(thickness: 1, color: Colors.white))
                                  ],
                                ),
                              ),
                              hintText: 'Enter email address',
                              fillColor: Colors.grey.withOpacity(.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 21),


                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(

                            obscureText: passwordVisible,
                            validator: (data){
                              if(data!.isEmpty){
                                return 'Please enter password';
                              }
                            },
                            controller: passwordcontroller,
                            style: customTextStyle,
                            cursorColor: Colors.black,
                            decoration: buildInputDecoration(
                              suffixIcon:   IconButton(onPressed: (){
                                passwordVisible = !passwordVisible;
                                setState(() {

                                });

                              }, icon: passwordVisible ?  Icon(Icons.visibility_off_outlined,color: Colors.grey,) :Icon(Icons.visibility_outlined, color: Colors.grey,)),
                              prefixIcon:  ImageIcon(
                                AssetImage('assets/images/pass.png'),
                                color: Colors.white,
                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        Column(
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                                          return ForgetPasswordView();
                                        }));
                                      },
                                      child: CustomText(
                                        text: 'forgot password',
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                                          return SignupView();
                                        }));
                                      },
                                      child: const CustomText(
                                        text: 'New user',
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(flex: 2),

                                BlocProvider<LoginCubit>(
                                  create: (context) => LoginCubit(LoginService()),
                                  child: BlocConsumer<LoginCubit, LoginStates>(
                                    builder: (context, state) {
                                      if(state is InitLoginState || state is FailureLoginState || state is SucessLoginState){
                                       return   InkWell(
                                         onTap: (){
                                         if(formKey.currentState!.validate()){
                                           context.read<LoginCubit>().login(username: emailcontroller.text, password: passwordcontroller.text);
                                         }
                                         },
                                         child: CustomText(
                                           text: 'Login',
                                           fontSize: 13,
                                           color: Colors.white,
                                           fontWeight: FontWeight.w800,
                                         ),
                                       );
                                      } else if(state is LoadingLoginState){
                                        return SpinKitThreeBounce(
                                          size: 20,
                                          color: Colors.white,);
                                      }else{
                                        return SizedBox();
                                      }

                                    },

                                    listener: (context, state) async {

                                      if (state is SucessLoginState ) {
                                        FocusScope.of(context).unfocus();
                                        Navigator.pushReplacement(context, PageRouteBuilder(
                                            pageBuilder: (context, an, sc) {
                                              return  RootView();
                                            }));
                                      } else if (state is FailureLoginState) {
                                        if(state.statusCode==401){

                                          CustomSnackBar.show(context, 'Email not found or incorrect password.');
                                        } else{

                                          CustomSnackBar.show(context, state.message);
                                        }


                                      }
                                    },
                                  ),
                                ),

                                SizedBox(width: 10,),
                                Spacer(),
                              ],
                            ),
                            CustomVerticalSizeBox(padding: 7,),
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
