import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/const/appFont.dart';
import 'package:edokiddo/controller/authHelper.dart';
import 'package:edokiddo/controller/handleFireStore.dart';
import 'package:edokiddo/view/screens/HomePage.dart';
import 'package:edokiddo/view/screens/forgetpass.dart';
import 'package:edokiddo/view/screens/registerScreen.dart';
import 'package:edokiddo/view/screens/splashScreen.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  FirestoreHelper firestoreHelper= FirestoreHelper();
  bool isShowPass = true;
  bool isDriver=false;
  bool remmberme=true;



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: new BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background1.jpg"), fit: BoxFit.fitHeight,),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 40,),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                        size: 20,
                      )
                  ),
                  Text(
                    "Login",
                    style: AppFont.bold.copyWith(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // TextFieldAddress(vi
                  //     textEditingController: emailController, lableText: "Email"),
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
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Email",
                        alignLabelWithHint: true, // center labastyle
                        labelStyle: AppFont.regular.copyWith(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
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
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPassScreen()));
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot your password?",
                        style: AppFont.medium.copyWith(
                          fontSize: 13,
                          color: Colors.blue
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                        AuthenticationHelper()
                            .signIn(email: emailController.text.trim(), password:passController.text.trim())
                            .then((result)async{
                          if (result == null) {
                            await AuthenticationHelper.getuser();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) =>HomePage()));
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                result==null?"":result,
                                style: TextStyle(fontSize: 16),
                              ),
                            ));
                          }
                        });
                      },
                      child: Text(
                        "Login".toUpperCase(),
                        style: AppFont.medium
                            .copyWith(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 200,
                      width: 250,
                      child: Image.asset("assets/images/lion.png")),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                    },
                    child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style: AppFont.medium.copyWith(fontSize: 15),
                              children: [
                                TextSpan(
                                  text: "Register",
                                  style: AppFont.bold.copyWith(
                                      fontSize: 15, color: Colors.blue),
                                )
                              ]),
                        )),
                  ),
                  SizedBox(height: 5,)
                ],
              ),
            ),
          ),
      ),
    );
  }
}
