import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:gifts/fearures/home/presentation/manager/getUserInfoCubit.dart';
import 'package:iconly/iconly.dart';
import '../../../litls/widgets/check_internet_connection.dart';
import '../../../litls/widgets/connected_to_internet.dart';
import '../../home/presentation/view/homeView.dart';
import '../../inbox/presentation/view/inboxView.dart';
import '../../setting/presentation/view/settingView.dart';


class RootView extends StatefulWidget {
  RootView({this.current = 1});

  @override
  final int current;

  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late int _selectedIndex;
  List<Widget> navBarScreens = [
    InboxView(),
    BlocProvider(
        create: (context) => GetUseriInfoCbit(GetUserInfoService()),
        child: HomeView()),
    SettingView(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: navBarScreens[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            endIndent: 10,
            indent: 10,
            color: Colors.white.withOpacity(.2),
          ),
          SizedBox(height: 10),
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage('assets/images/inboxActive.png'),
                  color: Colors.white,
                  size: 25,
                ),
                icon: ImageIcon(
                  AssetImage('assets/images/inbox.png'),
                  color: Colors.white,
                ),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  IconlyBold.home,
                  size: 25,
                  color: Colors.white,
                ),
                icon: Icon(
                  IconlyLight.home,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  IconlyBold.setting,
                  size: 25,
                  color: Colors.white,
                ),
                icon: Icon(
                  IconlyLight.setting,
                  color: Colors.white,
                ),
                label: 'Settings',
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
    // return

    //   Consumer<ConnectivityProvider>(
    //   builder: (context, connectivityProvider, child) {
    //     if (!connectivityProvider.isConnected || !connectivityProvider.hasInternetAccess) {
    //       return const ConnectedToInternet(message: 'No internet connection');
    //     }
    //     return Scaffold(
    //       backgroundColor: Colors.black,
    //       body: navBarScreens[_selectedIndex],
    //       bottomNavigationBar: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Divider(
    //             height: 1,
    //             endIndent: 10,
    //             indent: 10,
    //             color: Colors.white.withOpacity(.2),
    //           ),
    //           SizedBox(height: 10),
    //           BottomNavigationBar(
    //             backgroundColor: Colors.transparent,
    //             elevation: 0,
    //             currentIndex: _selectedIndex,
    //             onTap: (index) {
    //               setState(() {
    //                 _selectedIndex = index;
    //               });
    //             },
    //             type: BottomNavigationBarType.fixed,
    //             selectedItemColor: Colors.white,
    //             unselectedItemColor: Colors.grey,
    //             selectedFontSize: 12,
    //             unselectedFontSize: 12,
    //             items: const [
    //               BottomNavigationBarItem(
    //                 activeIcon: ImageIcon(
    //                   AssetImage('assets/images/inboxActive.png'),
    //                   color: Colors.white,
    //                   size: 25,
    //                 ),
    //                 icon: ImageIcon(
    //                   AssetImage('assets/images/inbox.png'),
    //                   color: Colors.white,
    //                 ),
    //                 label: 'Inbox',
    //               ),
    //               BottomNavigationBarItem(
    //                 activeIcon: Icon(
    //                   IconlyBold.home,
    //                   size: 25,
    //                   color: Colors.white,
    //                 ),
    //                 icon: Icon(
    //                   IconlyLight.home,
    //                   color: Colors.white,
    //                 ),
    //                 label: 'Home',
    //               ),
    //               BottomNavigationBarItem(
    //                 activeIcon: Icon(
    //                   IconlyBold.setting,
    //                   size: 25,
    //                   color: Colors.white,
    //                 ),
    //                 icon: Icon(
    //                   IconlyLight.setting,
    //                   color: Colors.white,
    //                 ),
    //                 label: 'Settings',
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 10),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
