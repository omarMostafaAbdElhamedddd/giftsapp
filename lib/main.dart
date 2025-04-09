import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gifts/fearures/root/presentation/rootView.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fearures/auth/login/presentation/view/loginView.dart';
import 'litls/widgets/check_internet_connection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';

  runApp(MyApp(token: token));
}


class MyApp extends StatelessWidget{
  const MyApp({super.key, required this.token});
final String token;

  @override
  Widget build(BuildContext context) {
    print(token);
    return
      // ChangeNotifierProvider(
      // create: (context)=>ConnectivityProvider(),
      // child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token ==null || token == '' ?  LoginView() : RootView(),
      // ),
    );
  }
}



