import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/view/components/Question.dart';
import 'package:edokiddo/view/screens/GradePage.dart';
import 'package:flutter/material.dart';

class AssgimentScreen extends StatefulWidget {
  @override
  State<AssgimentScreen> createState() => _AssgimentScreenState();
}

class _AssgimentScreenState extends State<AssgimentScreen> {

int count=0;
TextEditingController ans1=TextEditingController();
TextEditingController ans2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.jpg"),
              fit: BoxFit.cover),

        ),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Assignment Lecture 1",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.deepPurple
            ),
            ),
            SizedBox(height: 80,),
            Question(
              question:"Apple",
              ans1: "assets/images/1 ans 1 eng.ass.jpeg",
              ans2:"assets/images/1 ans 2 eng. ass.jpeg",
              ans3:"assets/images/1 ans 3 eng.ass.jpeg" ,
              answer: ans1,
            ),
            Question(
              question:"Alligator",
              ans1: "assets/images/2 ans 1 eng.ass.jpeg",
              ans2: "assets/images/2 ans 2 eng.ass.jpeg",
              ans3: "assets/images/2 ans 3 eng.ass.jpeg" ,
              answer: ans2,
            ),
            SizedBox(height: 75,),
            SizedBox(
              width: MediaQuery.of(context).size.width*.8,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.backGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                onPressed: () {
                  if(ans1.text=="2")
                    count++;
                  if(ans2.text=="1")
                    count++;
                  String grade= count.toString()+"/2";
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>GradePage(grade))
                  );
                },
                child: Text(
                  "Submit ".toUpperCase(),
                  style: AppFont.medium
                      .copyWith(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
