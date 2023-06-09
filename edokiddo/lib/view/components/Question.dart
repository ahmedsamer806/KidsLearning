import 'package:flutter/cupertino.dart';

class Question extends StatefulWidget {
  String ans1,ans2,ans3,question;
  TextEditingController answer;
  Question({
    required this.ans1,
    required this.ans2,
    required this.ans3,
    required this.question,
    required this.answer
});

  @override
  State<Question> createState() => _QuestionState(
      ans1:  this.ans1,
      ans2:this.ans2,
      ans3:this.ans3,
      question: this.question,
      answer: this.answer);
}

class _QuestionState extends State<Question> {

  String ans1,ans2,ans3,question;
  TextEditingController answer=TextEditingController();

  _QuestionState({
    required this.ans1,
    required this.ans2,
    required this.ans3,
    required this.question,
    required this.answer,
  });
  int ans=1;

  @override
  Widget build(BuildContext context) {
    answer.text=ans.toString();
    return Column(
      children: [
        Text(question,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        ),
        SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap:(){
                setState(() {
                  ans=1;
                  answer.text=ans.toString();
                });
              },
              child: Container(
                height: 100,
                width: 100,
                child:  Opacity(
                  opacity: ans==1?1.0:0.5,
                  child: Image.asset(ans1,

                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {
                  ans=2;
                  answer.text=ans.toString();
                });
              },
              child: Container(

                height: 100,
                width: 100,
                child: Opacity(
                  opacity: ans==2?1.0:0.5,
                  child: Image.asset(ans2,

                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {
                  ans=3;
                  answer.text=ans.toString();
                });
              },
              child: Container(
                height: 100,
                width: 100,
                child:  Opacity(
                  opacity: ans==3?1.0:0.5,
                  child: Image.asset(ans3,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 70,),
      ],
    );
  }
}
