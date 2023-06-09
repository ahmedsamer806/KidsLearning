import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/model/serivceData/data.dart';
import 'package:edokiddo/view/components/games.dart';
import 'package:edokiddo/view/screens/EntertainmentList.dart';
import 'package:edokiddo/view/screens/courselistScreen.dart';
import 'package:flutter/material.dart';

class EntertainmentScreen extends StatefulWidget {

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {

  @override
  void initState() {

    super.initState();
  }

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
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EtertainmenlisttScreen(
                        image: "assets/images/cartoon-modified.png",
                        title: "Cartoons",
                        lecList: AppData.CartoonList
                    )));
              },
              child: CustomPromotionCard2(
                title: "Cartoons",
                subTitle: "Your best way to have fun",
                imgPass: "assets/images/cartoon-modified.png",
                cr: AppColors.tiredColor,
              ),
            ),
            SizedBox(height: 80,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EtertainmenlisttScreen(
                        image: "assets/images/game-modified.png",
                        title: "Games",
                        lecList: AppData.GameList
                    )));
              },
              child: CustomPromotionCard2(
                title: "Games",
                subTitle: "Your best way to have fun",
                imgPass: "assets/images/games2-modified.png",
                cr: AppColors.primaryColorRed,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
