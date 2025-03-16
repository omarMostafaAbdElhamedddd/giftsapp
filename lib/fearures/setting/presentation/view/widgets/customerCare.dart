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
  bool phoneStatus  = false;

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
            GestureDetector(
              onTap: (){
                emailStatus = !emailStatus;
                setState(() {

                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xff242424),
                  borderRadius: BorderRadius.circular(30)
                ),

                child: Row(
                  children: [
                    Icon(Icons.email_outlined , color: Colors.white,),
                    SizedBox(width: 15,),
                    CustomText(text: 'Email' , color: Colors.white,),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.white,size: 14,)
                  ],
                ),
              ),
            ),

            emailStatus ? Container(
              margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200
              ),
              child: Center(child: CustomText(text: 'customer care@aerpgift.com',)),
            ) : SizedBox(),

            SizedBox(height: 30,),

            GestureDetector(
              onTap: (){
                phoneStatus = !phoneStatus;
                setState(() {
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 16),
                decoration: BoxDecoration(
                    color: Color(0xff242424),
                    borderRadius: BorderRadius.circular(30)
                ),

                child: Row(
                  children: [
                    Icon(Icons.phone , color: Colors.white,),
                    SizedBox(width: 15,),
                    CustomText(text: 'Phone' , color: Colors.white,),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.white,size: 14,)
                  ],
                ),
              ),
            ),

            phoneStatus ? Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                      color: Colors.grey.shade200
                  ),
                  child: Center(child: CustomText(text: ' +20123456789',)),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      color: Colors.grey.shade200
                  ),
                  child: Center(child: CustomText(text: ' +20123456789',)),
                )
              ],
            ) : SizedBox()
          ],
        ),
      ),
    );
  }
}
