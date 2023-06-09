import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/controller/authHelper.dart';
import 'package:edokiddo/controller/handleFireStore.dart';
import 'package:edokiddo/view/components/textFeildAddress.dart';
import 'package:edokiddo/view/screens/HomePage.dart';
import 'package:edokiddo/view/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final age = TextEditingController();
  final parantEmail = TextEditingController();
  FirestoreHelper firestoreHelper= FirestoreHelper();
  var isShowPass=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            decoration: new BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background1.jpg"), fit: BoxFit.fitHeight,),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    CircleAvatar(
                      radius: 50,
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/images/cat.png",
                        fit: BoxFit.fill,
                        )
                    ),
                  ],
                ),
                Text(
                  "Sign up",
                  style: AppFont.bold.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFieldAddress(
                            textEditingController: nameController, lableText: "Name"),
                        SizedBox(
                          height: 30,
                        ),
                        TextFieldAddress(
                            textEditingController: age, lableText: "Age"),
                        SizedBox(
                          height: 30,
                        ),
                        TextFieldAddress(
                            textEditingController: emailController,
                            lableText: "Email"),
                        SizedBox(
                          height: 30,
                        ),
                        TextFieldAddress(
                            textEditingController: parantEmail,
                            lableText: "Parent Email"),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.2),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ]),
                          child: TextFormField(
                            controller: passController,
                            obscureText: isShowPass,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Password",
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isShowPass =! isShowPass;
                                    });
                                  },
                                  child: Icon(
                                    isShowPass ? Icons.visibility : Icons.visibility_off,
                                    size: 16,
                                  )),
                              alignLabelWithHint: true,
                              // center labastyle
                              labelStyle: AppFont.regular.copyWith(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Already have an account?",
                      style: AppFont.medium.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Spacer(),
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
                      if(int.parse(age.text)>=3 && int.parse(age.text)<=5&& parantEmail.text.isNotEmpty&&nameController.text.isNotEmpty) {
                        AuthenticationHelper()
                            .signUp(email: emailController.text.trim(),
                            password: passController.text.trim())
                            .then((result) async {
                          if (result == null) {
                            firestoreHelper.addUser(
                                name: nameController.text,
                                email: FirebaseAuth.instance.currentUser!
                                    .email,
                                currentuserid: FirebaseAuth.instance
                                    .currentUser!.uid,
                                age: age.text.toString(),
                                parantEmail: parantEmail.text.toString()
                            );
                            await AuthenticationHelper.getuser();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                result,
                                style: TextStyle(fontSize: 16),
                              ),
                            ));
                          }
                        });
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                          "Check the age must be from 3 or 4 or 5",
                            style: TextStyle(fontSize: 16),
                            ) ,
                          ));
                      }
                      },
                    child: Text(
                      "sign up".toUpperCase(),
                      style: AppFont.medium
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
