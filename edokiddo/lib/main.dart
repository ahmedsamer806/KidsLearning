import 'package:edokiddo/model/serivceData/data.dart';
import 'package:edokiddo/view/screens/HomePage.dart';
import 'package:edokiddo/view/screens/assgiment.dart';
import 'package:edokiddo/view/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/screens/EducationScreen.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppData.getCartoonList();
  AppData.getGameList();
  AppData.getarabicList();
  AppData.getEnglishList();
  AppData.getMathsList();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edkiddo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}
