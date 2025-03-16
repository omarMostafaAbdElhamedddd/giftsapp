import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gifts/fearures/auth/login/presentation/view/loginView.dart';
import 'package:gifts/fearures/home/presentation/view/homeView.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';

import '../../../../../litls/widgets/logo.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpen = keyboardHeight > 0;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // إغلاق الكيبورد عند الضغط خارج الحقول
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // منع تغيير حجم الشاشة عند ظهور الكيبورد
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
                child: Image.asset(
                  'assets/images/bachround.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            /// 🔹 المحتوى الرئيسي مع تعديل الارتفاع عند ظهور الكيبورد
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: isKeyboardOpen ? keyboardHeight : 0,
              // تعديل ارتفاع المحتوى
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomVerticalSizeBox(padding: 2.6),
                      CustomText(
                        text: 'New user',
                        fontWeight: FontWeight.w800,
                        fontFamily: mainFont,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                      CustomVerticalSizeBox(padding: .5),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
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
                          style: customTextStyle,
                          cursorColor: Colors.black,
                          decoration: buildInputDecoration(
                            prefixIcon: ImageIcon(
                              AssetImage('assets/images/pass.png'),
                              color: Colors.white,
                            ),
                            hintText: 'New password',
                          ),
                        ),
                      ),
                      SizedBox(height: 21),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          style: customTextStyle,
                          cursorColor: Colors.black,
                          decoration: buildInputDecoration(
                            prefixIcon: ImageIcon(
                              AssetImage('assets/images/pass.png'),
                              color: Colors.white,
                            ),
                            hintText: 'Retype password',
                          ),
                        ),
                      ),
                      SizedBox(height: 21),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
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
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, PageRouteBuilder(
                                pageBuilder: (context, an, sc) {
                              return LoginView();
                            }));
                          },
                          child: CustomText(
                            text: 'Register',
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          )),
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
          ],
        ),
      ),
    );
  }
}
