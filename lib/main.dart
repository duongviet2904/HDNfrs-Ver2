import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdnfr_ver2/screens/onboarding.dart';
import 'package:hdnfr_ver2/screens/home_page.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider<ImageClassifyService>(
//       create: (context) => ImageClassifyService(),
//       child: MyApp(),
//     ),
//   );
// }

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Welcome to HDNFr!',
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS)
//       return CupertinoApp(
//         home: MySplashScreen(),
//         debugShowCheckedModeBanner: false,
//         title: 'HDNFriends',
//       );
//     else
//       return MaterialApp(
//         title: 'HDNFriends',
//         home: MySplashScreen(),
//         debugShowCheckedModeBanner: false,
//       );
//   }
// }
