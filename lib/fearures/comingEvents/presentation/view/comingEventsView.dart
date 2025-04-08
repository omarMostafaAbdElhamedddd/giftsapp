import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/comingEvents/data/eventModel.dart';
import 'package:gifts/fearures/comingEvents/presentation/manager/cubit.dart';
import 'package:gifts/fearures/comingEvents/presentation/manager/states.dart';
import 'package:gifts/fearures/comingEvents/presentation/view/eventDetails.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';

class CommingEventsView extends StatefulWidget {
  const CommingEventsView({super.key});

  @override
  State<CommingEventsView> createState() => _CommingEventsViewState();
}

class _CommingEventsViewState extends State<CommingEventsView> {
  bool dailyOrmonthly = true;

  @override
  void initState() {

    context.read<GetEventsCubit>().getEvents();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
       backgroundColor: Color(0xffDFDFDF),
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
                    text: 'Coming events',
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
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 30),
          child: BlocConsumer<GetEventsCubit, GetEventsStates>(
              builder: (context, state) {
                if (state is LoadingStateGetEvents) {
                  return Center(
                    child: SpinKitThreeBounce(
                      color: Colors.black,
                      size: 30,
                    ),
                  );
                } else if (state is SuccessStateGetEvents) {
                  return ListView.builder(
                      itemCount: state.event.length,
                      itemBuilder:(context,index){
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                            return EventDetails(eventModel: state.event[index],);
                          }));
                        },
                        child: CustomEvent(eventModel: state.event[index],));
                  });
                } else if (state is FailureStateGetEvents) {
                  return Center(
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      text: state.message,
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
              listener: (context, state) {}),
        )

        // Column(
        //   children: [
        //
        //     Container(
        //       padding: EdgeInsets.symmetric(horizontal: 30),
        //       decoration: BoxDecoration(
        //         color: Colors.black
        //       ),
        //
        //       child: Column(
        //         children: [
        //           SizedBox(height: 30,),
        //           Row(
        //             children: [
        //               GestureDetector(
        //                 onTap: (){
        //                   dailyOrmonthly = true;
        //                   setState(() {
        //
        //                   });
        //                 },
        //                 child: Container(
        //                   padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
        //                   decoration: BoxDecoration(
        //                     border: Border.all(color: dailyOrmonthly ?  Colors.white : Colors.transparent),
        //                     color: Color(0xff242424),
        //                     borderRadius: BorderRadius.circular(5)
        //                   ),
        //                   child: CustomText(text: 'Daily' ,color: Colors.white,),
        //                 ),
        //               ),
        //               Spacer(),
        //               GestureDetector(
        //                 onTap: (){
        //                   dailyOrmonthly = false;
        //                   setState(() {
        //
        //                   });
        //                 },
        //                 child: Container(
        //                   padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
        //                   decoration: BoxDecoration(
        //                     border: Border.all(color: !dailyOrmonthly ?  Colors.white : Colors.transparent),
        //                       color: Color(0xff242424),
        //                       borderRadius: BorderRadius.circular(5)
        //                   ),
        //                   child: CustomText(text: 'Monthly' ,color: Colors.white,),
        //                 ),
        //               ),
        //             ],
        //           ),
        //
        //           SizedBox(height: 30,),
        //         ],
        //       ),
        //     ),
        //
        //     Expanded(
        //       child: Container(
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         width: SizeConfig.screenWidth,
        //         color: Color(0xffDFDFDF),
        //         child: SingleChildScrollView(
        //           child: Column(
        //
        //             children: [
        //               SizedBox(height: 30,),
        //              dailyOrmonthly ?  DailyComingEvents() : MonthlyComingEvents(),
        //
        //
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //
        //
        //
        //   ],
        // ),

        );
  }
}

// class DailyComingEvents extends StatelessWidget {
//   const DailyComingEvents({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               color: Color(0xff181818)),
//           child: Center(
//               child: CustomText(
//             text: 'Friday 13th june 2022',
//             color: Colors.white,
//           )),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return CustomEvent();
//             }),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               color: Color(0xff181818)),
//           child: Center(
//               child: CustomText(
//             text: 'Saturday 14th june 2022',
//             color: Colors.white,
//           )),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return CustomEvent(eventModel: state.,);
//             }),
//         SizedBox(
//           height: 20,
//         ),
//       ],
//     );
//   }
// }

class CustomEvent extends StatelessWidget {
  const CustomEvent({super.key, required this.eventModel});
 final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Row(

        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: NetworkImage('https://api.airogift.com/public/images/events/${eventModel.image}'),
          ),
          SizedBox(
            width: 16,
          ),
          CustomText(text: eventModel.name),
          Spacer(),
          CustomText(
            text:  eventModel.date,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 14,
          )
        ],
      ),
    );
  }
}

// class MonthlyComingEvents extends StatelessWidget {
//   const MonthlyComingEvents({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               color: Color(0xff181818)),
//           child: Center(
//               child: CustomText(
//             text: ' June 2022',
//             color: Colors.white,
//           )),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return CustomEvent();
//             }),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               color: Color(0xff181818)),
//           child: Center(
//               child: CustomText(
//             text: ' june 2022',
//             color: Colors.white,
//           )),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return CustomEvent();
//             }),
//         SizedBox(
//           height: 20,
//         ),
//       ],
//     );
//   }
// }
