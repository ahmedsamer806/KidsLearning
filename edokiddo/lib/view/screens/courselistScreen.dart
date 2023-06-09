import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/view/components/lecCard.dart';
import 'package:edokiddo/view/screens/assgiment.dart';
import 'package:edokiddo/view/screens/quizScreen.dart';
import 'package:flutter/material.dart';

import 'package:edokiddo/model/lecPath.dart';

class CourselistScreen extends StatelessWidget {

  String title;
  String image;
  List<LecPath> lecList;

  CourselistScreen({
   required this.image,
   required this.title,
   required this.lecList,

});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg4.jpg"),
            fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                  fontSize: 30
                ),),
                Container(
                  height: 150,
                    width: 150,
                    child: Image.asset(image)),
              ],
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.5,
            child: ListView.builder(
              itemCount: lecList.length,
                itemBuilder:(context,index){
                return LecCard(
                    name:lecList[index].name,
                    urls:lecList[index].url
                );
                } ,
            ),
          ),
          //  CustomPromotionCard(),
            SizedBox(height: 30,),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuizScreen()));
                },
                child: Text(
                  " Quiz".toUpperCase(),
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
