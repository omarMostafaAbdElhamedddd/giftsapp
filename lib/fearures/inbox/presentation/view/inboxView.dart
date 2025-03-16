import 'package:flutter/material.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:iconly/iconly.dart';

import '../../../../litls/consts.dart';
import '../../../../litls/responsiveSize.dart';
import '../../../../litls/widgets/inputDecortion.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      CustomVerticalSizeBox(padding: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomText(
                                text: 'Friends',
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
                      CustomVerticalSizeBox(
                        padding: .8,
                      ),
                      TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration(
                            fillColor: Color(0xff4C4C4C),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                IconlyLight.search,
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Search'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              itemBuilder: (context, index) {
                                return CustomInboxItem();
                              })),
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
