import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirestoreHelper {

  static CollectionReference users = FirebaseFirestore.instance.collection('users');
  static CollectionReference grades = FirebaseFirestore.instance.collection('Quizes Grade');
  CollectionReference feedback = FirebaseFirestore.instance.collection('feedback');
  Future<void> addUser({name,email,currentuserid,parantEmail,age})async {

    return users
        .add({
      "Name":name.toString(),
      "Age":age,
      "Email":email.toString(),
      "ID":currentuserid,
      "Parant Email":parantEmail
    })
        .then((value) => print("User ADDed "))
        .catchError((error) => print("Failed to add User: $error"));
  }


  Future<void> addGrade({name,quizName,currentuserid,parantName,parantEmail,grade})async {

    return grades
        .add({
      "Name":name.toString(),
      "Quiz":quizName.toString(),
      "ID":currentuserid,
      "Parant Email":parantEmail,
      "grade":grade

    })
        .then((value) => print("grades ADDed "))
        .catchError((error) => print("Failed to add grades: $error"));
  }

  Future<void> AddFeedback({name,uid,feed,rate})async {
    // Call the user's CollectionReference to add a new userflu
    return feedback
        .add({
      'Name': name.toString(),
      'user uid':uid,
      'Feedbacks':feed.toString(),
      'Rating':rate
    })
        .then((value) => print("Feedback ADDed "))
        .catchError((error) => print("Failed to add feedback: $error"));
  }










}



