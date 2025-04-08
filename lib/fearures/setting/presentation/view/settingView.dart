

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gifts/fearures/setting/presentation/view/widgets/addNewCreditCart.dart';
import 'package:gifts/fearures/setting/presentation/view/widgets/customerCare.dart';
import 'package:gifts/fearures/setting/presentation/view/widgets/editProfileImage.dart';
import 'package:gifts/fearures/setting/presentation/view/widgets/languages.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            CustomVerticalSizeBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(
                  //   Icons.arrow_back_ios,
                  //   color: Colors.white,
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 12),
                    child: CustomText(
                      text: 'Setting',
                      color: Colors.white,
                      fontSize: 15,
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
            CustomVerticalSizeBox(padding: .8,),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * .08),
                  child: Column(
                    children: [

                      CustomSettingItem(
                        onTap: (){
                          Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                            return EditProfileImage();
                          }));
                        },
                          widget: Padding(
                            padding: const EdgeInsets.only(left: 1, right: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 8,
                                    width: 14,
                                    child: Divider(
                                        thickness: 1, color: Colors.white)),
                                SizedBox(
                                    height: 10,
                                    width: 25,
                                    child: Divider(
                                        thickness: 1, color: Colors.white))
                              ],
                            ),
                          ),
                          text: 'Edit profile picture'),
                      CustomSettingItem(
                        onTap: (){
                          Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                            return LanguageView();
                          }));
                        },
                          widget: ImageIcon(
                            AssetImage('assets/images/translate.png'),
                            color: Colors.white,
                          ),
                          text: 'Language'),
                      CustomSettingItem(
                          widget: ImageIcon(
                            AssetImage('assets/images/priv.png'),
                            color: Colors.white,
                          ),
                          text: ' Privacy policy'),
                      CustomSettingItem(
                          widget: ImageIcon(
                            AssetImage('assets/images/terms.png'),
                            color: Colors.white,
                          ),
                          text: 'Terms of use'),
                      CustomSettingItem(
                        onTap: (){
                          Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                            return AddNewCreditCard();
                          }));
                        },
                          widget: ImageIcon(
                            AssetImage('assets/images/add.png'),
                            color: Colors.white,
                          ),
                          text: 'Add credit card'),
                      CustomSettingItem(
                        onTap: (){
                          Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                            return CustomerCareView();
                          }));
                        },
                          widget: ImageIcon(
                            AssetImage('assets/images/customer care.png'),
                            color: Colors.white,
                          ),
                          text: 'Customer care'),
                    CustomVerticalSizeBox(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff4C4C4C)),
                        child: CustomText(
                          text: 'Log out',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSettingItem extends StatelessWidget {
  const CustomSettingItem(
      {super.key, required this.widget, required this.text, this.onPressed, this.onTap});

  final Widget widget;
  final String text;
  final void Function()? onPressed;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 20, right: 5, bottom: 4, top: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xff242424)),
        child: Row(
          children: [
            widget,
            SizedBox(
              width: 14,
            ),
            CustomText(
              text: text,
              color: Colors.white,
            ),
            SizedBox(
              width: 12,
            ),
            Spacer(),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
