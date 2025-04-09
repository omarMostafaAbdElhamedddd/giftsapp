import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/sendGift/data/userModel.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/getAppUsers/getAppUsersStates.dart';
import 'package:gifts/fearures/sendGift/presentation/manager/getAppUsers/getAppUserscubit.dart';
import 'package:gifts/fearures/sendGift/presentation/view/amountOfgift.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';
import 'package:flutter_contacts/contact.dart';

import '../../../auth/login/presentation/view/loginView.dart';
import '../manager/getGiftsCubit.dart';

class SendGiftView extends StatefulWidget {
  const SendGiftView({super.key, required this.email, required this.id, required this.balance});
 final String email;
 final int id;
 final double balance;
  @override
  State<SendGiftView> createState() => _SendGiftViewState();
}

class _SendGiftViewState extends State<SendGiftView> {
  TextEditingController searchController = TextEditingController();
  List<UserModel> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    context.read<GetAppUsersCubit>().getAppUsers();
  }

  void filterUsers(String query) {
    final cubitState = context.read<GetAppUsersCubit>().state;
    if (cubitState is SuccessStateGetAppUsers) {
      setState(() {
        if (query.isEmpty) {
          filteredUsers = cubitState.users;
        } else {
          filteredUsers = cubitState.users
              .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,'refresh');
        return false;
      },
      child: Scaffold(
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
                    Navigator.pop(context, 'refresh');
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
                    bottomRight: Radius.circular(32),
                  ),
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    Divider(
                      color: Colors.white.withOpacity(.3),
                      height: 10,
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: searchController,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        onChanged: filterUsers,
                        decoration: buildInputDecoration(
                          suffixIcon: searchController.text.isEmpty
                              ? SizedBox()
                              : InkWell(
                            onTap: () {
                              searchController.clear();
                              filterUsers('');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  child: BlocConsumer<GetAppUsersCubit, GetAppUsersStates>(
                    builder: (context, state) {
                      if (state is LoadingStateGetAppUsers) {
                        return SpinKitThreeBounce(
                          color: Colors.black,
                          size: 30,
                        );
                      } else if (state is SuccessStateGetAppUsers) {
                        if (filteredUsers.isEmpty &&
                            searchController.text.isEmpty) {
                          filteredUsers = state.users;
                        }

                        if (filteredUsers.isEmpty) {
                          return Center(
                            child: CustomText(
                              text: 'No users found!',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }

                        return Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: ListView.builder(
                            itemCount: filteredUsers.length,
                            itemBuilder: (context, index) {
                              return widget.id != filteredUsers[index].id
                                  ? CustomSearchItem(
                                userModel: filteredUsers[index],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (context, an, sc) {
                                            return BlocProvider<GetGiftsCubit>(
                                              create: (context) =>
                                                  GetGiftsCubit(
                                                      GetGiftsService()),
                                              child: AmountOfgiftView(
                                                balance: widget.balance,
                                                userModel:
                                                filteredUsers[index],
                                              ),
                                            );
                                          }));
                                },
                              )
                                  : SizedBox();
                            },
                          ),
                        );
                      } else if (state is FailureStateGetAppUsers) {
                        if (state.errorMessage ==
                            'Request denied or unauthorized.') {
                          return AlertDialog(
                            title: CustomText(
                              text: "Session Expired",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            content: CustomText(
                              maxLines: 4,
                              text:
                              "Your session has expired. Please log in again.",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(pageBuilder: (context, an, sc) {
                                      return LoginView();
                                    }),
                                  );
                                },
                                child: CustomText(
                                  text: 'Login',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CustomText(
                              text: state.errorMessage,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        }
                      } else {
                        return SizedBox();
                      }
                    },
                    listener: (context, state) {},
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


class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key, required this.userModel, this.onTap});

 final UserModel userModel;
 final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            userModel.image != ''
                ? CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey.shade100,
              backgroundImage: NetworkImage( 'https://api.airogift.com/public/images/users/${userModel.image}'),
            )
                : CircleAvatar(
              backgroundColor: Colors.white,
              child: CustomText(text: userModel.name[0].toUpperCase(),fontWeight: FontWeight.w600,),
            ),
            // CircleAvatar(
            //   backgroundColor: Colors.black,
            //   backgroundImage: AssetImage('assets/images/user.png'),
            // ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CustomText(
                    text: userModel.name,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  SizedBox(height: 2,),
                  CustomText(
                    text: userModel.phone,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  )
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined , size: 17,color: Colors.grey),
            SizedBox(width: 4,),

          ],
        ),
      ),
    );
  }
}
