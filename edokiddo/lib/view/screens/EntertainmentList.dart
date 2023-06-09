import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/view/components/entertainmtCrad.dart';
import 'package:edokiddo/view/components/lecCard.dart';
import 'package:flutter/material.dart';

import 'package:edokiddo/model/lecPath.dart';

class EtertainmenlisttScreen extends StatelessWidget {

  String title;
  String image;
  List<LecPath> lecList;

  EtertainmenlisttScreen({
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
            SizedBox(height: 120,),
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
                  return GameCard(name:lecList[index].name,urls:lecList[index].url);
                } ,
              ),
            ),
            //  CustomPromotionCard(),
            SizedBox(height: 80,),

          ],
        ),
      ),
    );
  }
}
