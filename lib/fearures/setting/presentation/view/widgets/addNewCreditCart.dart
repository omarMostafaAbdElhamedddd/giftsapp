import 'package:flutter/material.dart';
import 'package:gifts/fearures/sendGift/presentation/view/giftDeliveredSuccess.dart';
import 'package:gifts/litls/consts.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';

import '../../../../../litls/widgets/customText.dart';

class AddNewCreditCard extends StatelessWidget {
  const AddNewCreditCard({super.key});

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
                  text: 'Add new card',
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVerticalSizeBox(),
              CustomText(text: 'Card number' , color: Colors.white,),
              SizedBox(height: 5,),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: mainFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
                decoration: InputDecoration(
                  hintText: 'Enter card number',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: 20,),

              CustomText(text: 'Name on card' , color: Colors.white,),
              SizedBox(height: 5,),
              TextFormField(

                cursorColor: Colors.white,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: mainFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                decoration: InputDecoration(
                  hintText: 'Enter name on card',
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),

              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'Expiry date' , color: Colors.white,),
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: mainFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter expiry date',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(width: 16,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'CVC' , color: Colors.white,),
                      SizedBox(height: 5,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: mainFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter CVC',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              CustomVerticalSizeBox(padding: 1.2,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (context,an,sc){
                      return GiftDelivedSuccess(text: 'Card was added',);
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff4C4C4C)
                    ),
                    child: CustomText(text: 'Add card',color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
