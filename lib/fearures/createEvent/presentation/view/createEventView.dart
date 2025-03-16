import 'package:flutter/material.dart';
import 'package:gifts/fearures/createEvent/presentation/view/widgets/desiredCash.dart';
import 'package:gifts/fearures/createEvent/presentation/view/widgets/eventTypeView.dart';
import 'package:gifts/fearures/createEvent/presentation/view/widgets/friendsSelection.dart';
import 'package:gifts/fearures/sendGift/presentation/view/giftDeliveredSuccess.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:iconly/iconly.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key,  this.status1 =false,  this.status2=false,  this.status3=false,  this.status4=false,  this.status5=false ,});
 final bool status1;
  final bool status2;
  final bool status3;
  final bool status4;
  final bool status5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  text: 'Create event',
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
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
            CustomVerticalSizeBox(padding: 1.3,),
              CustomCreateEventView(
                status: status1,
                onTap: (){
                  Navigator.push(context,PageRouteBuilder(pageBuilder:(context,a,sc){
                    return EventTypeView();
                  }));
                },

                text: 'Event type', widget: Padding(
                padding: const EdgeInsets.only(left: 1, right: 10),
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
              ),),
              SizedBox(height: 20,),
              CustomCreateEventView(
                status: status2,
                text: 'Date',
                widget: Icon(Icons.date_range, color: Colors.white,),),
              SizedBox(height: 20,),

              CustomCreateEventView(
                status: status3,
                onTap: (){
                  Navigator.push(context,PageRouteBuilder(pageBuilder: (context,an,sc){
                    return DesiredCachView();
                  }));
                },

                text: 'Desired cash ',
                widget: Icon(Icons.monetization_on_sharp, color: Colors.white,),),

              SizedBox(height: 20,),
              CustomCreateEventView(
                status: status4,
                onTap: (){
                  Navigator.push(context,PageRouteBuilder(pageBuilder: (context,an,sc){
                    return FriendSelectionView();
                  }));
                },
                text: 'friend selection', widget:ImageIcon(
                AssetImage(
                  'assets/images/person.png',
                ),
                color: Colors.white,
              ),),
              SizedBox(height: 20,),
              CustomCreateEventView(

                status: status5,
                text: 'Upload photo', widget:ImageIcon(
                AssetImage(
                  'assets/images/gallery.png',
                ),
                color: Colors.white,
              ),),
               CustomVerticalSizeBox(padding: 1,),
              Center(
                child: GestureDetector(
                  onTap: (){

                    if (status1 && status2 && status3 && status4 && status5) {
                      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
                        return  GiftDelivedSuccess(text: 'Event created');
                      }));
                    }else{
                      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
                        return CreateEventView(status1: true,status2: true,status3: true,status4: true,status5: true,);
                      }));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff4C4C4C)
                    ),
                    child: CustomText(text: 'Create',color: Colors.white,),
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

class CustomCreateEventView extends StatelessWidget {
  const CustomCreateEventView(
      {super.key, required this.text, required this.widget, this.onTap , this.status=false});

  final String text;
  final bool status;
  final Widget widget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff242424)
              ),

              child: Row(
                children: [
                  widget,
                  SizedBox(width: 16,),
                  CustomText(text: text, color: Colors.white,),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
        
        status ? Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ImageIcon(AssetImage('assets/images/success.png' ,), color: Colors.green,),
        ) : SizedBox()
        
        
      ],
    );
  }
}
