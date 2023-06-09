import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/controller/authHelper.dart';
import 'package:edokiddo/controller/handleFireStore.dart';
import 'package:edokiddo/view/components/Question.dart';
import 'package:edokiddo/view/screens/GradePage.dart';
import 'package:edokiddo/view/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class GraduationScreen extends StatefulWidget {
  @override
  State<GraduationScreen> createState() => _GraduationScreenState();
}

class _GraduationScreenState extends State<GraduationScreen> {

  TextEditingController ans1=TextEditingController();
  TextEditingController ans2=TextEditingController();
  TextEditingController ans3=TextEditingController();
  TextEditingController ans4=TextEditingController();
  TextEditingController ans5=TextEditingController();
  TextEditingController ans6=TextEditingController();
  int count=0;
  FirestoreHelper firestoreHelper= FirestoreHelper();
  //===================== sending mail ========================

  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'ahmed.samer806@gmail.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
    //  attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

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
              Text("Garduation Quiz",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.deepPurple
              ),
              ),
              SizedBox(height: 80,),
              Question(
                question:" 1 + 3 = ",
                ans1: "assets/images/gradQuiz/1 ans 1 grad.quiz.jpeg",
                ans2:"assets/images/gradQuiz/1 ans 2 grad.quiz.jpeg",
                ans3:"assets/images/gradQuiz/1 ans 3 grad.quiz.jpeg" ,
                answer: ans1,
              ),
              Question(
                question:" 5 + 4 = ",
                ans1: "assets/images/gradQuiz/2 ans 1 grad.quiz.jpeg",
                ans2: "assets/images/gradQuiz/2 ans 2 grad.quiz.jpeg",
                ans3: "assets/images/gradQuiz/2 ans 3 grad.quiz.jpeg" ,
                answer: ans2,
              ),
              Question(
                question:"Fish",
                ans1: "assets/images/gradQuiz/3 ans 1 grad.quiz.jpeg",
                ans2: "assets/images/gradQuiz/3 ans 2 grad.quiz.jpeg",
                ans3: "assets/images/gradQuiz/3 ans 3 grad.quiz.jpeg" ,
                answer: ans3,
              ),
              Question(
                question:"Dog",
                ans1: "assets/images/gradQuiz/4 ans 1 grad.quiz.jpeg",
                ans2: "assets/images/gradQuiz/4 ans 2 grad.quiz.jpeg",
                ans3: "assets/images/gradQuiz/4 ans 3 grad.quiz.jpeg" ,
                answer: ans4,
              ),
              Question(
                question:"سمكة",
                ans1: "assets/images/gradQuiz/5 ans 1 grad.quiz.jpeg",
                ans2: "assets/images/gradQuiz/5 ans 2 grad.quiz.jpeg",
                ans3: "assets/images/gradQuiz/5 ans 3 grad.quiz.jpeg" ,
                answer: ans5,
              ),

              Question(
                question:"بقرة",
                ans1: "assets/images/gradQuiz/6 ans 1 grad.quiz.jpeg",
                ans2: "assets/images/gradQuiz/6 ans 2 grad.quiz.jpeg",
                ans3: "assets/images/gradQuiz/6 ans 3 grad.quiz.jpeg" ,
                answer: ans6,
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
                  onPressed: ()async {
                    if(ans1.text=="2")
                      count++;
                    if(ans2.text=="1")
                      count++;
                    if(ans3.text=="1")
                      count++;
                    if(ans4.text=="1")
                      count++;
                    if(ans5.text=="3")
                      count++;
                    if(ans6.text=="1")
                      count++;
                    firestoreHelper.addGrade(
                        name: AuthenticationHelper.app_user['Name'],
                        parantEmail:AuthenticationHelper.app_user['Parant Email'],
                        currentuserid: AuthenticationHelper.app_user['ID'],
                        grade: count.toString()+"/6",
                        quizName: "Graduation Quiz"
                    );ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Your Grade is Saving.........",
                        style: TextStyle(fontSize: 16),
                      ),
                    ));
                    await Future.delayed(const Duration(seconds: 1), (){});
                    String grade=count.toString()+"/6";
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
