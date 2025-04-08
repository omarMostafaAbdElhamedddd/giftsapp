import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/createEvent/presentation/view/widgets/desiredCash.dart';
import 'package:gifts/fearures/createEvent/presentation/view/widgets/eventTypeView.dart';
import 'package:gifts/fearures/createEvent/presentation/view/widgets/friendsSelection.dart';
import 'package:gifts/fearures/sendGift/presentation/view/giftDeliveredSuccess.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customButton.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../litls/widgets/customSnackBar.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';


class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key,  this.status1 =false,  this.status2=false,  this.status3=false,  this.status4=false,  this.status5=false ,});
 final bool status1;
  final bool status2;
  final bool status3;
  final bool status4;
  final bool status5;

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  String? selectedDate;

  Future<void> pickEventDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formatted = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        selectedDate = formatted;
      });
    }
  }
  final ImagePicker imagePicker = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController= TextEditingController();
  final TextEditingController contentConroller = TextEditingController();
  XFile? image;
  String? pathImage;

  void uploadImage() async {
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickImage;
    });
  }
  List<TextEditingController> controllers = [];
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color: Colors.grey,thickness: .3,),
                SizedBox(height: 30,),

                Row(
                  children: [
                    CustomText(text: 'Upload event image', color: Colors.grey,fontWeight: FontWeight.bold,),
                    Spacer(),

                   image ==null ?  InkWell(
                      onTap: (){
                        uploadImage();
                        setState(() {

                        });
                      },
                      child: ImageIcon(
                        AssetImage('assets/images/uploadImage.png',), color: Colors.white,size: 30,),
                    ) : Stack(
                     alignment: Alignment.bottomRight,
                      children: [
                        ClipOval(
                          child: Image.file(
                            File(image!.path),
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill, // لضبط الصورة داخل الدائرة
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            uploadImage();
                            setState(() {

                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white
                            ),
                            child: ImageIcon(
                              AssetImage('assets/images/uploadImage.png',), color: Colors.black,size: 16,),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10,),
                  ],
                ),

                Divider(color: Colors.grey,thickness: .3,height: 40,),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 5),
                  child: CustomText(text: 'Event name' , color: Colors.white,),
                ),

                TextFormField(
              controller: nameController,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                 validator: (data){
                   if(data!.isEmpty){
                     return 'Please enter name';
                   }
                 },
                  cursorColor: Colors.white,
                       decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                hintText:  'Enter name here',
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                filled: true,
                fillColor: Color(0xff505050),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                ),
                ),
                SizedBox(height: 26,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 5),
                  child: CustomText(text: 'Event content' , color: Colors.white,),
                ),
                TextFormField(
                  controller: contentConroller,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'Please enter event content';
                    }
                    return null;
                  },
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Enter event content',
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xff505050),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                 SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 5),
                  child: CustomText(text: 'Event date' , color: Colors.white,),
                ),
                 GestureDetector(
                   onTap: pickEventDate,
                   child: Container(
                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(16),
                       color:  Color(0xff505050),
                     ),

                     child: Row(
                       children: [
                         CustomText(text:selectedDate!=null ? selectedDate! :  'Select event date', color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12,),
                         Spacer(),
                         Icon(Icons.date_range_outlined, color: Colors.grey,)
                       ],
                     ),
                   ),
                 ),


                SizedBox(height: 25,),
                CustomVideoURL(
                  date: selectedDate??'',
                  controllers: controllers,formKey: formKey,image: image, name: nameController.text, content: contentConroller.text,)





              ],
            ),
          ),
        ),
      )

      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Column(
      //       children: [
      //       CustomVerticalSizeBox(padding: 1.3,),
      //         CustomCreateEventView(
      //           status: status1,
      //           onTap: (){
      //             Navigator.push(context,PageRouteBuilder(pageBuilder:(context,a,sc){
      //               return EventTypeView();
      //             }));
      //           },
      //
      //           text: 'Event type', widget: Padding(
      //           padding: const EdgeInsets.only(left: 1, right: 10),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               SizedBox(
      //                   height: 10,
      //                   width: 17,
      //                   child: Divider(thickness: 1, color: Colors.white)),
      //               SizedBox(
      //                   height: 10,
      //                   width: 26,
      //                   child: Divider(thickness: 1, color: Colors.white))
      //             ],
      //           ),
      //         ),),
      //         SizedBox(height: 20,),
      //         CustomCreateEventView(
      //           status: status2,
      //           text: 'Date',
      //           widget: Icon(Icons.date_range, color: Colors.white,),),
      //         SizedBox(height: 20,),
      //
      //         CustomCreateEventView(
      //           status: status3,
      //           onTap: (){
      //             Navigator.push(context,PageRouteBuilder(pageBuilder: (context,an,sc){
      //               return DesiredCachView();
      //             }));
      //           },
      //
      //           text: 'Desired cash ',
      //           widget: Icon(Icons.monetization_on_sharp, color: Colors.white,),),
      //
      //         SizedBox(height: 20,),
      //         CustomCreateEventView(
      //           status: status4,
      //           onTap: (){
      //             Navigator.push(context,PageRouteBuilder(pageBuilder: (context,an,sc){
      //               return FriendSelectionView();
      //             }));
      //           },
      //           text: 'friend selection', widget:ImageIcon(
      //           AssetImage(
      //             'assets/images/person.png',
      //           ),
      //           color: Colors.white,
      //         ),),
      //         SizedBox(height: 20,),
      //         CustomCreateEventView(
      //
      //           status: status5,
      //           text: 'Upload photo', widget:ImageIcon(
      //           AssetImage(
      //             'assets/images/gallery.png',
      //           ),
      //           color: Colors.white,
      //         ),),
      //          CustomVerticalSizeBox(padding: 1,),
      //         Center(
      //           child: GestureDetector(
      //             onTap: (){
      //
      //               if (status1 && status2 && status3 && status4 && status5) {
      //                 Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
      //                   return  GiftDelivedSuccess(text: 'Event created');
      //                 }));
      //               }else{
      //                 Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
      //                   return CreateEventView(status1: true,status2: true,status3: true,status4: true,status5: true,);
      //                 }));
      //               }
      //             },
      //             child: Container(
      //               padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 10),
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5),
      //                   color: Color(0xff4C4C4C)
      //               ),
      //               child: CustomText(text: 'Create',color: Colors.white,),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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

class CustomVideoURL extends StatefulWidget {
  const CustomVideoURL({super.key, required this.controllers, required this.formKey, this.image, required this.name, required this.content, required this.date});
 final List<TextEditingController> controllers;
 final GlobalKey<FormState> formKey;
  final XFile? image;
  final String name;
  final String date;
  final String content;
  @override
  State<CustomVideoURL> createState() => _CustomVideoURLState();
}

class _CustomVideoURLState extends State<CustomVideoURL> {
  List<int> items = [0];
  late List<TextEditingController> controllers ;

  @override
  void initState() {
    controllers = [TextEditingController()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: items.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 5),
                      child: CustomText(text: 'Event video URL' , color: Colors.white,),
                    ),
                    ClipRRect(
                      borderRadius:BorderRadius.circular(16),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        controller: controllers[index],
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            hintText: 'Enter  Event video URL',
                            hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                            ),
                            filled: true,
                            fillColor:Color(0xff505050),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(width: 16,),

               index == items.length-1 ?  InkWell(
                  onTap: (){
                    setState(() {
                      items.add(items.length);
                      controllers.add(TextEditingController());

                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 4),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.add),
                  ),
                ):InkWell(
                 onTap: (){
               setState(() {
                 controllers.removeAt(index);
                 items.removeAt(index);
                 items = List.generate(
                     controllers.length, (i) => i);
               });

                 },
                 child: Container(
                   margin: EdgeInsets.only(bottom: 4),
                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: Colors.white,
                   ),
                   child: Icon(Icons.delete_forever_outlined, color: Colors.red,),
                 ),
               ),
              ],
            ),
          );
        }),

         CustomVerticalSizeBox(padding: 1,),
        BlocProvider(
            create: (context) => InsertEventCubit(
                InsertEventService()),
            child: BlocConsumer<
                InsertEventCubit,
                InsertEventStates>(
              builder: (context, state) {
                if (state is InitStateInsertEvent ||
                    state is FailureStateInsertEvent ||
                    state is SuccessStateInsertEvent) {
                  return    CustomButton(text: 'Create event', onTap: (){
                    if(widget.formKey.currentState!.validate()){
                      if(widget.image ==null){
                        CustomSnackBar.show(context,"Please upload event image" , backgroundColor: Colors.grey);
                      }

                     if(widget.date ==''){
                       CustomSnackBar.show(context,"Please select event date" , backgroundColor: Colors.grey);
                     }else{
                       List<String> videosUrl = [];

                       for(int i=0; i<controllers.length; i++){
                         videosUrl.add(controllers[i].text);
                       }


                       context.read<
                           InsertEventCubit>()
                           .createEvent(
                           date: widget.date,
                           name: widget.name,
                           content: widget.content,
                           imagePath: widget.image!.path,
                           videos: videosUrl


                       );
                     }

                    }
                  },);


                } else
                if (state is LoadingStateInsertEvent) {
                  return SpinKitThreeBounce(
                    size: 30,
                    color: Colors.white,
                  );
                } else {
                  return SizedBox();
                }
              },
              listener: (context, state) {
                if (state is SuccessStateInsertEvent) {
                  Navigator.push(context,
                      PageRouteBuilder(
                          pageBuilder: (context, an,
                              sc) {
                            return  GiftDelivedSuccess(text: 'Event\n Inserted',);
                          }));
                } else
                if (state is FailureStateInsertEvent) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                      behavior: SnackBarBehavior
                          .floating,
                      content: CustomText(
                        text: state.message,
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )));
                }
              },
            )),
        SizedBox(height: 30,),
      ],
    );
  }
}

