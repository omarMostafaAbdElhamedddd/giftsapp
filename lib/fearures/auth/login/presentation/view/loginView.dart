import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gifts/fearures/auth/signup/presentation/view/signupView.dart';
import 'package:gifts/fearures/home/presentation/view/homeView.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';

import '../../../../../litls/widgets/logo.dart';
import '../../../../root/presentation/rootView.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpen = keyboardHeight > 0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // إغلاق الكيبورد عند الضغط خارج الحقول
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, // منع تغيير حجم الشاشة عند ظهور الكيبورد
        body: Stack(
          children: [
            /// 🔹 الخلفية الثابتة مع التدرج
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

            /// 🔹 المحتوى الرئيسي مع تعديل الارتفاع عند ظهور الكيبورد
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: isKeyboardOpen ? keyboardHeight : 0, // تعديل ارتفاع المحتوى
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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

                      /// 🔹 حقل اسم المستخدم
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
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
                            hintText: 'Username',
                            fillColor: Colors.grey.withOpacity(.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 21),

                      /// 🔹 حقل كلمة المرور
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          style: customTextStyle,
                          cursorColor: Colors.black,
                          decoration: buildInputDecoration(
                            prefixIcon:  ImageIcon(
                              AssetImage('assets/images/pass.png'),
                              color: Colors.white,
                            ),
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      /// 🔹 الأزرار والخيارات الإضافية
                      Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  CustomText(
                                    text: 'forgot password',
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  SizedBox(height: 8),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                                        return SignupView();
                                      }));
                                    },
                                    child: CustomText(
                                      text: 'New user',
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(flex: 2),
                              InkWell(
                                onTap: (){
                                  FocusScope.of(context).unfocus();
                                  Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                                    return RootView();
                                  }));
                                },
                                child: CustomText(
                                  text: 'Login',
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),

                          CustomVerticalSizeBox(padding: 7,),
                          CustomLogo(),
                          CustomVerticalSizeBox(),
                        ],

                      ),

                      /// 🔹 مسافة إضافية عند فتح الكيبورد
                      // SizedBox(height: isKeyboardOpen ? 20 : SizeConfig.screenHeight! * .34),

                      /// 🔹 الشعار

                    ],
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
