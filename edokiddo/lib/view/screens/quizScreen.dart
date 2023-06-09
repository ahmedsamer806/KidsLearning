import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/controller/authHelper.dart';
import 'package:edokiddo/controller/handleFireStore.dart';
import 'package:edokiddo/view/components/Question.dart';
import 'package:edokiddo/view/screens/GradePage.dart';
import 'package:flutter/material.dart';


class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int count=0;
  FirestoreHelper firestoreHelper= FirestoreHelper();
  TextEditingController ans1=TextEditingController();
  TextEditingController ans2=TextEditingController();
  TextEditingController ans3=TextEditingController();
  TextEditingController ans4=TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("English Quiz",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.deepPurple
              ),
              ),
              SizedBox(height: 80,),
              Question(
                question:"Ball",
                ans1: "assets/images/quiz/1 ans 1 eng.quiz.jpeg",
                ans2:"assets/images/quiz/1 ans 2 eng.quiz.jpeg",
                ans3:"assets/images/quiz/1 ans 3 eng.quiz.jpeg" ,
                answer: ans1,
              ),
              Question(
                question:"Cat",
                ans1: "assets/images/quiz/2 ans 1 eng.quiz.jpeg",
                ans2: "assets/images/quiz/2 ans 2 eng.quiz.jpeg",
                ans3: "assets/images/quiz/2 ans 3 eng.quiz.jpeg" ,
                answer: ans2,
              ),
              Question(
                question:"Duck",
                ans1: "assets/images/quiz/3 ans 1 eng.quiz.jpeg",
                ans2: "assets/images/quiz/3 ans 2 eng.quiz.jpeg",
                ans3: "assets/images/quiz/3 ans 3 eng.quiz.jpeg" ,
                answer: ans3,
              ),
              Question(
                question:"Dog",
                ans1: "assets/images/quiz/4 ans 1 eng.quiz.jpeg",
                ans2: "assets/images/quiz/4 ans 2 eng.quiz.jpeg",
                ans3: "assets/images/quiz/4 ans 3 eng.quiz.jpeg" ,
                answer: ans4,
              ),
              SizedBox(height: 40,),
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
                  onPressed: ()async  {
                    if(ans1.text=="1")
                      count++;
                    if(ans2.text=="3")
                      count++;
                    if(ans3.text=="2")
                      count++;
                    if(ans4.text=="3")
                      count++;
                    firestoreHelper.addGrade(
                      name: AuthenticationHelper.app_user['Name'],
                      parantEmail:AuthenticationHelper.app_user['Parant Email'],
                      currentuserid: AuthenticationHelper.app_user['ID'],
                      grade: count.toString()+"/4",
                      quizName: "English Quiz"
                    );ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Your Grade is Saving.........",
                        style: TextStyle(fontSize: 16),
                      ),
                    ));
                    String grade=count.toString()+"/4";
                    await Future.delayed(const Duration(seconds: 1), (){});
                    Route route = MaterialPageRoute(builder: (context) => GradePage(grade));
                    Navigator.pushReplacement(context, route);
                  },
                  child: Text(
                    "Submit ".toUpperCase(),
                    style: AppFont.medium
                        .copyWith(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
