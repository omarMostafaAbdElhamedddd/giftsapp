import 'package:flutter/material.dart';
import 'package:gifts/fearures/sendGift/presentation/view/amountOfgift.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';

class SendGiftView extends StatelessWidget {
  const SendGiftView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomText(
                  text: 'Send gift',
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                  color: Colors.black),
              child: Column(
                children: [
                  Divider(
                    color: Colors.white.withOpacity(.3),
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight:FontWeight.w600
                      ),
                      decoration: buildInputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),


            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 16),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey
                ),

                child: ListView.builder(itemBuilder:(context,index){
                  return CustomSearchItem(
                    onTap: (){
                      Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                        return AmountOfgiftView();
                      }));
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key, this.onTap});
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            SizedBox(width: 20,),

            CustomText(text: 'Mohamed charaf' , color: Colors.white,fontSize:14,)
          ],
        ),
      ),
    );
  }
}
