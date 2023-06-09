import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/view/components/games.dart';
import 'package:edokiddo/view/components/homePageCard.dart';
import 'package:edokiddo/view/screens/EntertainmentScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {


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
            CustomPromotionCard(),
            SizedBox(height: 80,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EntertainmentScreen()));
              },
              child: CustomPromotionCard2(
                title: "Entertainment",
              subTitle: "Your best way to have fun",
              imgPass: "assets/images/cat.png",
              cr: AppColors.tiredColor,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
