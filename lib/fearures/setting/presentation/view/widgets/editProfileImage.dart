import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/setting/presentation/manager/updateDataStates.dart';
import 'package:gifts/fearures/setting/presentation/manager/updateDatacubit.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customButton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../../litls/widgets/customText.dart';
import '../../../../home/presentation/manager/getUserInfoCubit.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({super.key});

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file;
  String? imagePath;

  void chooseImgae() async {
    final imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = imageFile;
    });
  }

  void takeImagte() async {
    final imageFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      file = imageFile;
    });
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
                  text: 'Upload picture',
                  color: Colors.white,
                  fontSize: 13,
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
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.screenHeight! * .08),
                  height: SizeConfig.screenHeight! * .17,
                  decoration: BoxDecoration(color: Colors.black),
                ),
                Container(
                  height: SizeConfig.screenHeight! * .2,
                  width: SizeConfig.screenHeight! * .2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // لو عايز تضيف إطار خارجي للصورة:
                     border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ClipOval(
                    child: file == null
                        ?Image.network(
                          'https://api.airogift.com/public/images/users/${GetUserInfoService.image}',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey.shade200,
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                            );
                          },
                        )

                        : Image.file(
                      File(file!.path),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),

            CustomVerticalSizeBox(),

            
            InkWell(
              onTap: () {
                chooseImgae();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(13)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageIcon(
                      AssetImage(
                        'assets/images/gallery.png',
                      ),
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                      text: 'Choose another image',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),

           SizedBox(height: 20,),

            InkWell(
              onTap: () {
                takeImagte();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(13)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageIcon(
                      AssetImage(
                        'assets/images/take image.png',
                      ),
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                      text: 'Take another image by camera',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),


            CustomVerticalSizeBox(
              padding: 1.3,
            ),

            file != null
                ? BlocProvider(
                    create: (context) => UpdateDatacubit(UpdateDataservice()),
                    child: BlocConsumer<UpdateDatacubit, UpdateDataStates>(
                      builder: (context, state) {
                        if (state is InitUpdateDataState ||
                            state is FailureUpdateDataState ||
                            state is SuccessUpdateDataState) {
                          return CustomButton(
                            text: 'Upload',
                            onTap: () {
                              context.read<UpdateDatacubit>().updateData(
                                  image: file!.path,
                              );
                            },
                          );
                        } else if (state is LoadingUpdateDataState) {
                          return SpinKitThreeBounce(
                            size: 30,
                            color: Colors.black,
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                      listener: (context, state) async {
                        if (state is SuccessUpdateDataState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              showCloseIcon: true,
                              closeIconColor: Colors.white,
                              behavior: SnackBarBehavior.floating,
                              content: CustomText(
                                text: 'Image has been updated successfully',
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )));
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pop(context);
                        } else if (state is FailureUpdateDataState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              showCloseIcon: true,
                              closeIconColor: Colors.white,
                              behavior: SnackBarBehavior.floating,
                              content: CustomText(
                                text: state.errorMessage,
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )));
                        }
                      },
                    ))
                : CustomButton(
                    text: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
