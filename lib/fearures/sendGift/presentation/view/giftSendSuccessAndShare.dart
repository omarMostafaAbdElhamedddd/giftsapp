import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/litls/widgets/customButton.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import '../../../../litls/responsiveSize.dart';
import '../../../../litls/widgets/customText.dart';
import 'dart:ui' as ui;

class SuccessSendGiftView extends StatefulWidget {
  const SuccessSendGiftView(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.phone,
      this.photoOrThumbnail,
      required this.ContactName,
      required this.content,
      required this.contactId,
      required this.email,
      required this.gift_id});

  final String name;
  final String image;
  final double price;
  final String ContactName;
  final String phone;
  final photoOrThumbnail;
  final String content;
  final String contactId;
  final String email;
  final int gift_id;

  @override
  State<SuccessSendGiftView> createState() => _SuccessSendGiftViewState();
}

class _SuccessSendGiftViewState extends State<SuccessSendGiftView> {
  GlobalKey _globalKey = GlobalKey(); // مفتاح للـ RepaintBoundary

  Future<void> _captureAndShare() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // حفظ الصورة في ملف مؤقت
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/screenshot.png');
      await file.writeAsBytes(pngBytes);

      // مشاركة الصورة عبر التطبيقات المختلفة
      Share.shareFiles(
        [file.path],
      );
    } catch (e) {
      print("خطأ أثناء التقاط الشاشة: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.image);
    SizeConfig().init(context);
    return Material(
      child: Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: _globalKey,
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(32),
                                        bottomLeft: Radius.circular(32))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Center(
                                          child: CustomText(
                                        text: 'The gift has been sent successfully!',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                            color: Colors.green,
                                      )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                          child: Image.asset(
                                        'assets/images/7518748.png',
                                        height: SizeConfig.screenHeight! * .2,
                                        fit: BoxFit.cover,
                                      )),
                                      CustomVerticalSizeBox(padding: .6,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: CustomText(text: 'To',fontWeight: FontWeight.bold,fontSize: 14,),
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            widget.photoOrThumbnail != null
                                                ? CircleAvatar(
                                                    backgroundImage: MemoryImage(
                                                        widget.photoOrThumbnail!),
                                                  )
                                                : CircleAvatar(
                                                    backgroundColor: Colors.grey.shade200,
                                                    child: CustomText(
                                                      text: widget.ContactName[0],
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(

                                                  text: widget.ContactName,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                CustomText(
                                                  text: widget.phone,
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundColor: Colors.green,
                                              child: FittedBox(
                                                  child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              )),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),

                                    ],
                                  ),
                                ),
                              ),


                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey.shade200)),
                                child: Column(
                                  children: [
                                    Image.network(

                                      widget.image,
                                      height: SizeConfig.screenHeight! * .12,
                                      loadingBuilder: (context ,child,loadingProgress){
                                        if(loadingProgress ==null){
                                          return child;
                                        }else{
                                          return SpinKitThreeBounce(color:Colors.black,size: 30,);
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text: widget.name,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    SizedBox(
                                      height: 16,
                                    ),
                                    CustomText(
                                      fontSize: 17,
                                      text: '${widget.price}\$',
                                      color: Color(0xff00BFFF),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                              CustomVerticalSizeBox(
                                padding: .8,
                              ),
                              Image.asset(

                                'assets/images/Airogift.png',
                                height: 30,
                                color: Colors.black,
                              ),

                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),

          InkWell(
            onTap: _captureAndShare,
            child: Container(
              margin:EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical: 14),
              decoration:BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Share Gift Receipt" , color: Colors.white,fontWeight: FontWeight.bold,),
                  SizedBox(width: 10,),
                  Icon(Icons.share , color: Colors.white,size: 16,)
                ],
              ),
            ),
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}
