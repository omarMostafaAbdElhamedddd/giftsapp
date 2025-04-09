// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gifts/litls/consts.dart';
// import 'package:gifts/litls/widgets/customButton.dart';
// import 'package:provider/provider.dart';
//
// import '../responsiveSize.dart';
// import 'check_internet_connection.dart';
// import 'customText.dart';
//
// class ConnectedToInternet extends StatelessWidget {
//   const ConnectedToInternet({super.key, required this.message});
//
//   final String message;
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           SizedBox(
//             width: SizeConfig.screenWidth,
//             height: SizeConfig.screenHeight,
//             child: ShaderMask(
//               shaderCallback: (Rect bounds) {
//                 return LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.86),
//                     Colors.black.withOpacity(0.8),
//                     Colors.black.withOpacity(0.7),
//                   ],
//                 ).createShader(bounds);
//               },
//               blendMode: BlendMode.darken,
//               child: FadeInImage(
//                 placeholder: AssetImage(
//                   'assets/images/bachround.jpg',
//                 ),
//                 image: AssetImage(
//                   'assets/images/bachround.jpg',
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Spacer(),
//               Image.asset(
//                 'assets/images/no-wifi.png',
//                 color: Colors.white,
//                 height: SizeConfig.screenHeight! * .1,
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               CustomText(
//                 color: Colors.white,
//                 text: message,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//               SizedBox(height: 20,),
//               InkWell(
//                onTap: (){
//                  Provider.of<ConnectivityProvider>(context, listen: false).checkConnectivity();
//                },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(8)
//                   ),
//                   child: CustomText(
//                     text: 'Refresh',
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Image.asset(
//                   'assets/images/Airogift.png',
//               height: 20,
//               ),
//               SizedBox(height: 30,),
//             ],
//           ),
//         ],
//       ),
//     );
//
//     Material(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/no-wifi.png',
//             height: SizeConfig.screenHeight! * .15,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15, bottom: 30),
//             child: Center(
//               child: CustomText(
//                 text: message,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: mainFont,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
