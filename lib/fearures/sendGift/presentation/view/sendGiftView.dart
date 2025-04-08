import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gifts/fearures/sendGift/presentation/view/amountOfgift.dart';
import 'package:gifts/litls/responsiveSize.dart';
import 'package:gifts/litls/widgets/customText.dart';
import 'package:gifts/litls/widgets/inputDecortion.dart';
import 'package:flutter_contacts/contact.dart';

import '../manager/getGiftsCubit.dart';

class SendGiftView extends StatefulWidget {
  const SendGiftView({super.key, required this.email});
 final String email;
  @override
  State<SendGiftView> createState() => _SendGiftViewState();
}

class _SendGiftViewState extends State<SendGiftView> {
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    if (await FlutterContacts.requestPermission(readonly: true)) {
      List<Contact> fetchedContacts =
          await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        contacts = fetchedContacts;
        filteredContacts = fetchedContacts;
      });
    }
  }

  void filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredContacts = contacts;
      } else {
        filteredContacts = contacts
            .where((contact) =>
                contact.displayName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      bottomRight: Radius.circular(32)),
                  color: Colors.black),
              child: Column(
                children: [
                  Divider(
                    color: Colors.white.withOpacity(.3),
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: searchController,
                      cursorColor: Colors.white,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      onChanged: filterContacts,
                      decoration: buildInputDecoration(
                        suffixIcon: searchController.text.isEmpty ? SizedBox() :  InkWell(
                          onTap: (){
                              searchController.clear();
                              setState(() {
                               filteredContacts = contacts; });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            margin: EdgeInsets.all(10),
                            child: Icon(Icons.clear , color: Colors.red,size: 18,),
                          ),
                        ),

                        // IconButton(onPressed:(){
                        //   searchController.clear();
                        //   setState(() {
                        //     filteredContacts = contacts;
                        //   });
                        // }, icon: Icon(Icons.close ,color: Colors.red,size: 18,)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                child: contacts.isEmpty
                    ? Center(child: SpinKitThreeBounce(color: Colors.black ,size: 22,)) // عرض اللودر أثناء التحميل فقط
                    : filteredContacts.isNotEmpty
                    ? ListView.builder(
                  itemCount: filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = filteredContacts[index];
                    return CustomSearchItem(
                      photoOrThumbnail: contact.photoOrThumbnail,
                      name: contact.displayName,
                      phone: contact.phones.isNotEmpty ? contact.phones.first.number : "No number",
                      onTap: () {


                        Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, an, sc) {
                            return BlocProvider(create:(context)=>GetGiftsCubit(GetGiftsService()) , child: AmountOfgiftView(
                              email: widget.email,
                               id: contact.id,
                              photoOrThumbnail: contact.photoOrThumbnail,
                              name: contact.displayName,
                              phoneNumber: contact.phones.isNotEmpty ? contact.phones.first.number : "",
                            ),);
                          },
                        ));
                      },
                    );
                  },
                )
                    : Center(
                  child: CustomText(
                    text: "لا توجد نتائج مطابقة",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key, this.onTap, required this.name, required this.phone, this.photoOrThumbnail});

  final String name;
  final String phone;
  final void Function()? onTap;
 final photoOrThumbnail;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            photoOrThumbnail != null
                ? CircleAvatar(
              backgroundImage: MemoryImage(photoOrThumbnail!),
            )
                : CircleAvatar(
              backgroundColor: Colors.white,
              child: CustomText(text: name[0],fontWeight: FontWeight.w500,),
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
                    text: name,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  SizedBox(height: 2,),
                  CustomText(
                    text: phone,
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
