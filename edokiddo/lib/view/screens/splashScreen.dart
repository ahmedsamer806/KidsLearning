import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/view/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/edukiddo.jpeg"),
          SizedBox(height: 65,),
          SizedBox(
            width: MediaQuery.of(context).size.width*.85,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen()));
              },
              child: Text(
                "Let's Start".toUpperCase(),
                style: AppFont.medium
                    .copyWith(fontSize: 15, color: Colors.black),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
