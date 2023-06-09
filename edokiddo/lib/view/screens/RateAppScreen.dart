import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/controller/authHelper.dart';
import 'package:edokiddo/controller/handleFireStore.dart';
import 'package:edokiddo/view/components/textFeildAddress.dart';
import 'package:edokiddo/view/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FeedbackScreen extends StatelessWidget {


  FirestoreHelper firestoreHelper= FirestoreHelper();
  final feeds = TextEditingController();
  final rate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg3.jpg"),
                fit: BoxFit.cover,),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                      size: 20,
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Add Feedback",
                  style: AppFont.bold.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFieldAddress(
                    textEditingController: rate, lableText: "Rate From 0 to 10 "),
                SizedBox(
                  height: 40,
                ),
                TextFieldAddress(
                    textEditingController: feeds, lableText: "Feedback"),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColorRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    onPressed: () async{
                      if (feeds.text.isNotEmpty){
                        firestoreHelper.AddFeedback(
                            name:AuthenticationHelper.app_user['Name'],
                            uid:FirebaseAuth.instance.currentUser?.uid.toString(),
                            rate:rate.text ,
                            feed:feeds.text.toString()
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Your Feedback is Saving.........",
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                        await Future.delayed(const Duration(seconds: 1), (){});
                        Route route = MaterialPageRoute(builder: (context) => HomePage());
                        Navigator.pushReplacement(context, route);
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "You must add your feedback.........",
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                        await Future.delayed(const Duration(
                            seconds: 1), () {});
                      }},
                    child: Text(
                      "ADD".toUpperCase(),
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
