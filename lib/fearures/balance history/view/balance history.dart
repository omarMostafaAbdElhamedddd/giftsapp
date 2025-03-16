
import 'package:flutter/material.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';

class BalanceHistoryView extends StatefulWidget {
  const BalanceHistoryView({super.key});

  @override
  State<BalanceHistoryView> createState() => _BalanceHistoryViewState();
}

class _BalanceHistoryViewState extends State<BalanceHistoryView> {
  bool dailyOrmonthly = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                  text: 'Balance history',
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
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.black
              ),

              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          dailyOrmonthly = true;
                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: dailyOrmonthly ?  Colors.white : Colors.transparent),
                              color: Color(0xff242424),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: CustomText(text: 'Daily' ,color: Colors.white,),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          dailyOrmonthly = false;
                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: !dailyOrmonthly ?  Colors.white : Colors.transparent),
                              color: Color(0xff242424),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: CustomText(text: 'Monthly' ,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: SizeConfig.screenWidth,
                color: Color(0xffDFDFDF),
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      SizedBox(height: 30,),
                      dailyOrmonthly ?  DailyComingEvents(index: 0 ,) : MonthlyComingEvents(),


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

class DailyComingEvents extends StatelessWidget {
  const DailyComingEvents({super.key, required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10 ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Color(0xff181818)
          ),

          child: Center(child: CustomText(text: 'Friday 13th june 2022',color: Colors.white,)),
        ),
        SizedBox(height: 20,),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context,index){
              return CustomEvent(index: index,);
            }),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10 ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Color(0xff181818)
          ),

          child: Center(child: CustomText(text: 'Saturday 14th june 2022',color: Colors.white,)),
        ),
        SizedBox(height: 20,),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context,index){
              return CustomEvent(index:index,);
            }),
        SizedBox(height: 20,),

      ],
    );
  }
}

class CustomEvent extends StatelessWidget {
  const CustomEvent({super.key, required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6 , horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7)
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          SizedBox(width: 16,),
          CustomText(text: 'Mohamed charaf'),
          Spacer(),
          Column(
            children: [
              CustomText(text: 'Wedding' , fontWeight: FontWeight.w500,),
              SizedBox(height: 5,),
              index %2== 0 ? CustomText(

                text: '+314\$', fontWeight: FontWeight.w600,fontSize: 14,color: Colors.green,)
                  : CustomText(text: '-314\$', fontWeight: FontWeight.w600,fontSize: 14,color: Colors.red,)
            ],
          ),
          SizedBox(width: 16,),
          Icon(Icons.arrow_forward_ios , size: 12,)
        ],
      ),
    );
  }
}

class MonthlyComingEvents extends StatelessWidget {
  const MonthlyComingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10 ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Color(0xff181818)
          ),

          child: Center(child: CustomText(text: ' June 2022',color: Colors.white,)),
        ),
        SizedBox(height: 20,),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context,index){
              return CustomEvent(index: index,);
            }),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10 ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Color(0xff181818)
          ),

          child: Center(child: CustomText(text: ' june 2022',color: Colors.white,)),
        ),
        SizedBox(height: 20,),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context,index){
              return CustomEvent(index: index,);
            }),
        SizedBox(height: 20,),

      ],
    );
  }
}


