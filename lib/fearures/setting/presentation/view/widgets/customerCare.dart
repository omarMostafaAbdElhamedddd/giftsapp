import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';

import '../../../../../litls/widgets/customText.dart';

class CustomerCareView extends StatefulWidget {
  const CustomerCareView({super.key});

  @override
  State<CustomerCareView> createState() => _CustomerCareViewState();
}

class _CustomerCareViewState extends State<CustomerCareView> {
  bool emailStatus = false;
  bool phoneStatus = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Padding(
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
                  text: 'Customer care',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomVerticalSizeBox(),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const ExpansionTile(
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,
                backgroundColor: Color(0xff242424),
                collapsedBackgroundColor: Color(0xff242424),
                leading:   Icon(
                  Icons.email_outlined,
                  color: Colors.white,),
                title:   CustomText(
                  text: 'Email',
                  color: Colors.white,
                ),
                children: [
                  Column(
                    children: [
                      Divider(color: Colors.grey,height: 1,),
                      SizedBox(height: 16,),
                      Center(child: CustomText(text: 'Admin@arirogift.com',color: Colors.white,height: 1.6,)),


                      SizedBox(height: 10,),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ExpansionTile(
                collapsedIconColor: Colors.white,
                iconColor: Colors.white,

                 backgroundColor: Color(0xff242424),
                collapsedBackgroundColor: Color(0xff242424),
                leading:   Icon(
                  Icons.phone,
                  color: Colors.white,),
                title:   CustomText(
                  text: 'Phone',
                  color: Colors.white,
                ),

                children: [
                 Column(
                   children: [
                     Divider(color: Colors.grey,height: 1,),
                     SizedBox(height: 16,),
                     Center(child: CustomText(text: '+201030653634',color: Colors.white,height: 1.6,)),
                      Divider(color: Colors.grey,thickness: .08,height: 20,),
                      CustomText(text: '+201030653634',color: Colors.white,height: 1.6,),
                     SizedBox(height: 10,),
                   ],
                 ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
