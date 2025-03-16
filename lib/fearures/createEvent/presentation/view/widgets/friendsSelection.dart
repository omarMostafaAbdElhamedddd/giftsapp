import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';

import '../../../../../litls/widgets/customText.dart';
import '../createEventView.dart';

class FriendSelectionView extends StatelessWidget {
  const FriendSelectionView({super.key});

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
                  text: 'Frined selection',
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16

        ),
        child: Column(
          children: [
               CustomVerticalSizeBox(),
            TextFormField(
              decoration: buildInputDecoration(hintText: 'Search'),
            ),
            SizedBox(height: 30,),

            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 8,
                ),
                SizedBox(width: 16,),
                CustomText(text: 'All friends' , color: Colors.white,),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 8,
                ),
                SizedBox(width: 16,),
                CustomText(text: 'All friends exclude' , color: Colors.white,),
              ],
            ),
            SizedBox(height: 20,),


            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                  borderRadius: BorderRadius.circular(13)
                ),

                child: ListView.builder(itemBuilder:(contxt , index){
                  return  CustomFriendSelectionItem();
                }),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
                    return CreateEventView(status4: true,);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff4C4C4C)
                  ),
                  child: CustomText(text: 'Done',color: Colors.white,),
                ),
              ),
            ),
            SizedBox(height: 30,),

          ],
        ),
      ),

    );

  }
}

class CustomFriendSelectionItem extends StatelessWidget {
  const CustomFriendSelectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          SizedBox(width: 10,),
          CustomText(text: 'Mohamed charaf' , color: Colors.white,),
          Spacer(),
          Container(
            padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)
              ),
              child: Icon(

                Icons.close ,size: 16, color: Colors.white,))
        ],
      ),
    );
  }
}

