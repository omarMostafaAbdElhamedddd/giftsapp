
import 'package:flutter/material.dart';
import 'package:gifts/fearures/balance%20history/data/balanceHistoryModel.dart';
import 'package:gifts/fearures/balance%20history/data/giftModelHistory.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';

class BalanceHistoryView extends StatefulWidget {
  const BalanceHistoryView({super.key, required this.gifts, required this.balances});

  final List<GiftModelHistory> gifts;
  final List<BalanceHistoryModel> balances;
  @override
  State<BalanceHistoryView> createState() => _BalanceHistoryViewState();
}

class _BalanceHistoryViewState extends State<BalanceHistoryView> {
  bool giftsOrBalnces = true;

  @override
  Widget build(BuildContext context) {
 print(widget.gifts[0].type);
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
                  text: 'History',
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
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
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            giftsOrBalnces = true;
                            setState(() {

                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 26 , vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: giftsOrBalnces ?  Colors.white : Colors.transparent),
                                color: Color(0xff242424),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(child: CustomText(text: 'Gifts history' ,color: Colors.white,)),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),

                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            giftsOrBalnces = false;
                            setState(() {

                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: !giftsOrBalnces ?  Colors.white : Colors.transparent),
                                color: Color(0xff242424),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(child: CustomText(text: 'Balance history' ,color: Colors.white,)),
                          ),
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
                      giftsOrBalnces ?  GiftsHistoryWidge(gifts: widget.gifts,) : BalanceHistoryWidget(balances: widget.balances,),


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

class GiftsHistoryWidge extends StatelessWidget {
  const GiftsHistoryWidge({super.key, required this.gifts,});
 final List<GiftModelHistory> gifts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: gifts.length,
            itemBuilder: (context,index){
              return CustomEvent(giftModelHistory:gifts[index],);
            }),
        SizedBox(height: 20,),




      ],
    );
  }
}

class CustomEvent extends StatelessWidget {
  const CustomEvent({super.key, required this.giftModelHistory,});
 final GiftModelHistory giftModelHistory;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7)
      ),
      child: Row(
        children: [

          Container(
            padding: EdgeInsets.all(10),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200
            ),
            child: Image.asset('assets/images/user.png'),
          ),
          SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text:   giftModelHistory.type == 'in' ? 'From' : "To", fontSize: 8,fontWeight: FontWeight.w600,color: Colors.blueAccent,),
              CustomText(text: giftModelHistory.name),
              SizedBox(height: 2,),
              CustomText(text: giftModelHistory.phone, fontSize: 12,color: Colors.grey,),
            ],
          ),
          Spacer(),
          Column(
            children: [
              CustomText(text: giftModelHistory.date.split(' ')[0] , fontWeight: FontWeight.w500,fontSize: 10,),
              SizedBox(height: 5,),
             giftModelHistory.type == 'in' ? CustomText(

                text: '+${giftModelHistory.amount}\$', fontWeight: FontWeight.w600,fontSize: 14,color: Colors.green,)
                  : CustomText(text: '-${giftModelHistory.amount}\$', fontWeight: FontWeight.w600,fontSize: 14,color: Colors.red,)
            ],
          ),
          SizedBox(width: 16,),
          Icon(Icons.arrow_forward_ios , size: 12,)
        ],
      ),
    );
  }
}

class BalanceHistoryWidget extends StatelessWidget {
  const BalanceHistoryWidget({super.key, required this.balances});
 final List<BalanceHistoryModel> balances;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: balances.length,
            itemBuilder: (context,index){
              return CustomBalanceItem(balanceHistoryModel: balances[index],);
            }),

        SizedBox(height: 20,),

      ],
    );
  }
}


class CustomBalanceItem extends StatelessWidget {
  const CustomBalanceItem({super.key, required this.balanceHistoryModel});
final BalanceHistoryModel balanceHistoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7)
      ),
      child: Row(
        children: [

          Icon(Icons.monetization_on , size: 32,),
          SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomText(text: "\$ ${balanceHistoryModel.amount} has been successfully added to your account.", maxLines: 3,fontSize: 14,),
              ],
            ),
          ),

          Column(
            children: [
              CustomText(text: balanceHistoryModel.date.split(' ')[0] , fontWeight: FontWeight.w500,fontSize: 10,),
              SizedBox(height: 5,),

            ],
          ),
          SizedBox(width: 16,),
          Icon(Icons.arrow_forward_ios , size: 12,)
        ],
      ),
    );
  }
}

