import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/view/screens/HomePage.dart';
import 'package:edokiddo/view/screens/RateAppScreen.dart';
import 'package:flutter/material.dart';

class GradePage extends StatelessWidget {
String Grade;
GradePage(this.Grade);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg3.jpg"),
              fit: BoxFit.cover,),
          ),
          child: Column(
            children: [
              Spacer(),
              Text("Your Grade",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30,),
              Text(Grade,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
              Row(
                children: [
                  SizedBox(height: 50,),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*.8
                ,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColorGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) =>FeedbackScreen()));
                  },
                  child: Text(
                    "Add Feedback".toUpperCase(),
                    style: AppFont.medium
                        .copyWith(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              Spacer()
            ],
          )
      ),
    );
  }
}
