import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';

import '../../../../../litls/widgets/customText.dart';
import '../createEventView.dart';
class EventTypeView extends StatefulWidget {
  const EventTypeView({super.key});

  @override
  State<EventTypeView> createState() => _EventTypeViewState();
}

class _EventTypeViewState extends State<EventTypeView> {
  List<bool> typesStatus =  [
    false,
    false,
    false
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

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
      ),
      backgroundColor: Colors.black,

      body: SafeArea(
        child: SingleChildScrollView (
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomVerticalSizeBox(padding: 1.2,),
                CustomEventType(
                  status:typesStatus[0] ,
                  onTap: (){
                    typesStatus = [
                      !typesStatus[0],
                      false,
                      false,
                    ];
                    setState(()  {

                    });
                  },
                  text: 'Wedding', widget: ImageIcon(
                  AssetImage(
                    'assets/images/wedding.png',
                  ),
                  color: Colors.white,
                ),),
                SizedBox(height: 20,),
                CustomEventType(
                  status:typesStatus[1] ,
                  onTap: (){
                    typesStatus = [
                      false,
                      !typesStatus[1],
                      false,
                    ];
                    setState(() {

                    });
                  },
                  text: 'Baby shower', widget:ImageIcon(
                  AssetImage(
                    'assets/images/baby shower.png',
                  ),
                  color: Colors.white,
                ),),
                SizedBox(height: 20,),
                CustomEventType(
                  status:typesStatus[2] ,
                  onTap: (){
                    typesStatus = [
                      false,
                      false,
                      !typesStatus[2],
                    ];
                    setState(() {

                    });
                  },
                  text: 'Other', widget: ImageIcon(
                  AssetImage(
                    'assets/images/other.png',
                  ),
                  color: Colors.white,
                ),),

                CustomVerticalSizeBox(padding: 1.2,),

                GestureDetector(
                  onTap: (){
                    if(typesStatus[0] || typesStatus[1] || typesStatus[2]){

                      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
                        return CreateEventView(status1: true,);
                      }));

                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(
                        text: 'Please select event type',
                        color: Colors.white,
                      )));
                    }
                  },
                  child: Container(

                    padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff4C4C4C),
                      borderRadius: BorderRadius.circular(5)
                    ),

                    child: CustomText(text: 'Done',color: Colors.white,),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
class CustomEventType extends StatelessWidget {
  const CustomEventType(
      {super.key, required this.text, required this.widget, this.onTap , this.status=false});

  final String text;
  final Widget widget;
  final void Function()? onTap;
  final bool status ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          status ?   Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
            ) : Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white ,width: 2),
                shape: BoxShape.circle
            ),
          ),
          ],
        ),
      ),
    );
  }
}