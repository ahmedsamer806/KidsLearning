import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/model/serivceData/data.dart';
import 'package:edokiddo/view/components/games.dart';
import 'package:edokiddo/view/screens/GraduationQuiz.dart';
import 'package:edokiddo/view/screens/courselistScreen.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    builder: (context) => CourselistScreen(
                        image:"assets/images/english2-modified-modified.png" ,
                        title: "ENGLISH",
                        lecList: AppData.EnglishList
                    )
                ));
              },
              child: CustomPromotionCard2(
                title: "English",
                subTitle: " ",
                imgPass: "assets/images/english2-modified-modified.png",
                cr: AppColors.tiredColor,

              ),
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CourselistScreen(
                        image:"assets/images/arabic (2).png" ,
                        title: "اللغة العربية",
                        lecList: AppData.arabicList
                    )
                ));
              },
              child: CustomPromotionCard2(
                title: "اللغة العربية",
                subTitle: " ",
                imgPass: "assets/images/arabic (2).png",
                cr:AppColors.primaryColorGray
              ),
            ),
            SizedBox(height: 50,),
               GestureDetector(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => CourselistScreen(
                           image:"assets/images/maths2-modified.png" ,
                           title: "MATHS",
                           lecList: AppData.mathsList
                       )
                   ));
                 },
                 child: CustomPromotionCard2(
                  title: "Maths",
                  subTitle: " ",
                  imgPass: "assets/images/maths2-modified.png",
                  cr: AppColors.primaryColorRed,
              ),
               ),
            SizedBox(height: 50,),
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
                      builder: (context) => GraduationScreen()));
                },
                child: Text(
                  "Graduation Quiz".toUpperCase(),
                  style: AppFont.medium
                      .copyWith(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
