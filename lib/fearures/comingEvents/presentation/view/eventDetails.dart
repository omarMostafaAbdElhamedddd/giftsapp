import 'package:flutter/material.dart';
import 'package:gifts/fearures/comingEvents/data/eventModel.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customButton.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../litls/widgets/customSnackBar.dart';
import '../../../../litls/widgets/customText.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  static Future<void> openURL(String url,BuildContext context, ) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      CustomSnackBar.show(context, "This link is unavailable or an error occurred.");
    }
  }

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
                  text: 'Event details',
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: SizeConfig.screenHeight! * .14,
                  width: SizeConfig.screenHeight! * .14,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://api.airogift.com/public/images/events/${widget.eventModel.image}'))),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 1),
                  child: CustomText(
                    text: widget.eventModel.name,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                CustomText(text: widget.eventModel.date, fontSize: 12,),
                SizedBox(height: 20,),

                CustomText(
                  textAlign: TextAlign.center,
                  text: widget.eventModel.content,
                  fontSize: 14,
                  maxLines: 6,
                ),
                Divider(
                  color: Colors.grey,
                  height: 70,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'Event videos URLs',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey , width: .4),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListView.builder(
                    itemCount: widget.eventModel.videosUrls.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                          onTap: (){
                            openURL(widget.eventModel.videosUrls[index], context);
                          },
                          text: 'Video URL ${index+1}'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
