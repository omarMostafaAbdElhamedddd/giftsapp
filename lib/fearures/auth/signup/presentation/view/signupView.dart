import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gifts/fearures/auth/login/presentation/view/loginView.dart';
import 'package:gifts/fearures/auth/signup/presentation/manager/cubit.dart';
import 'package:gifts/fearures/auth/signup/presentation/manager/states.dart';
import 'package:gifts/fearures/home/presentation/view/homeView.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';

import '../../../../../litls/widgets/customSnackBar.dart';
import '../../../../../litls/widgets/logo.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
   bool onSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpen = keyboardHeight > 0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus();
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
                child: Image.asset(
                  'assets/images/bachround.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: isKeyboardOpen ? keyboardHeight : 0,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomVerticalSizeBox(padding: 2.6),
                        const CustomText(
                          text: 'New user',
                          fontWeight: FontWeight.w800,
                          fontFamily: mainFont,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                        CustomVerticalSizeBox(padding: .5),
                        SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: nameController,
                            validator: (data){
                              if(data!.isEmpty){
                                return 'Please enter user name';
                              }
                            },
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
                              hintText: 'Username',
                              fillColor: Colors.grey.withOpacity(.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 21),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            obscureText: onSecurePassword,
                            controller: passwordController,
                            validator: (data){
                              if(data!.isEmpty){
                                return 'Please enter password';
                              }
                            },
                            style: customTextStyle,
                            cursorColor: Colors.black,
                            decoration: buildInputDecoration(
                              suffixIcon:   IconButton(onPressed: (){
                                onSecurePassword = !onSecurePassword;
                                setState(() {

                                });

                              }, icon: onSecurePassword ?  Icon(Icons.visibility_off_outlined,color: Colors.grey,) :Icon(Icons.visibility_outlined, color: Colors.grey,)),
                              prefixIcon: ImageIcon(
                                AssetImage('assets/images/pass.png'),
                                color: Colors.white,
                              ),
                              hintText: 'Enter password',
                            ),
                          ),
                        ),
                        SizedBox(height: 21),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            obscureText: onSecurePassword,
                            controller: passwordConfirmController,
                            validator: (data){
                              if(data!.isEmpty){
                                return 'Please confirm password';
                              }else if(data !=passwordController.text){
                                return 'Confirm password must match the password';
                              }
                            },
                            style: customTextStyle,
                            cursorColor: Colors.black,
                            decoration: buildInputDecoration(
                              suffixIcon:   IconButton(onPressed: (){
                                onSecurePassword = !onSecurePassword;
                                setState(() {

                                });

                              }, icon: onSecurePassword ?  Icon(Icons.visibility_off_outlined,color: Colors.grey,) :Icon(Icons.visibility_outlined, color: Colors.grey,)),
                              prefixIcon: ImageIcon(
                                AssetImage('assets/images/pass.png'),
                                color: Colors.white,
                              ),
                              hintText: 'Confirm password',
                            ),
                          ),
                        ),
                        SizedBox(height: 21),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: emailController,
                            validator: (data){
                              if(data!.isEmpty){
                                return 'Please enter email';
                              }
                            },
                            style: customTextStyle,
                            cursorColor: Colors.black,
                            decoration: buildInputDecoration(
                              prefixIcon: Icon(
                                CupertinoIcons.mail,
                                color: Colors.white,
                              ),
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        SizedBox(height: 21),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            validator: (data){
                              if(data!.isEmpty){
                                return 'Please enter phone number';
                              }
                            },
                            style: customTextStyle,
                            cursorColor: Colors.black,
                            decoration: buildInputDecoration(
                              prefixIcon: ImageIcon(
                                AssetImage('assets/images/phone.png'),
                                color: Colors.white,
                              ),
                              hintText: 'Phone number',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 31,
                        ),

                        BlocProvider<RegisterCubit>(
                          create: (context) => RegisterCubit(ReisterService()),
                          child: BlocConsumer<RegisterCubit, RegisterStates>(
                            builder: (context, state) {
                              if(state is InitStateRegister || state is FailureStateRegister || state is SuccessStateRegister){
                                return   InkWell(
                                  onTap: (){
                                    if(formKey.currentState!.validate()){
                                      context.read<RegisterCubit>().register(
                                        emailController.text , // email
                                        passwordController.text,  // password
                                        nameController.text,  // name
                                        phoneController.text,  // phone
                                      );
                                    }
                                  },
                                  child: CustomText(
                                    text: 'Register',
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                );
                              } else if(state is LoadingStateRegister){
                                return SpinKitThreeBounce(
                                  size: 20,
                                  color: Colors.white,);
                              }else{
                                return SizedBox();
                              }

                            },

                            listener: (context, state) async {

                              if (state is SuccessStateRegister ) {
                                FocusScope.of(context).unfocus();
                                Navigator.pushReplacement(context, PageRouteBuilder(
                                    pageBuilder: (context, an, sc) {
                                      return  LoginView();
                                    }));
                              } else if (state is FailureStateRegister) {

                                  CustomSnackBar.show(context, state.message);



                              }
                            },
                          ),
                        ),

                        CustomVerticalSizeBox(
                          padding: 4,
                        ),
                        CustomLogo(),
                        CustomVerticalSizeBox(),
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
