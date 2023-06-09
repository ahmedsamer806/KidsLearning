

import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/view/screens/assgiment.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LecDetails extends StatefulWidget {
  String urls;
  LecDetails(this.urls);

  @override
  State<LecDetails> createState() => _LecDetailsState(this.urls);
}

class _LecDetailsState extends State<LecDetails> {

  _LecDetailsState(this.urls);
String urls;
  bool flag =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration:  BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/bg3.jpg"),
        fit: BoxFit.cover,),
        ),
        child: Column
          (
          children: [
            SizedBox(height: 120,),

            GestureDetector(
              child: Container(
                height: 200,
                  width: 200,
                 // color: AppColors.primaryColorGray,
                  child: Image.asset("assets/images/education.png")),
                onTap:()async{
                var url = Uri.parse(urls);
                await _launchUniversalLinkIos(url);
                setState(() {
                  flag=true;
                });
                }
                ),
            SizedBox(height: 15,),
            Text(flag?"ReWatch the video":"Watch the video"
              ,style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorRed

              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
                child: Container(
                    height: 200,
                    width: 200,
                    // color: AppColors.primaryColorGray,
                    child: Image.asset("assets/images/ass.png")),
                onTap:(){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AssgimentScreen()));
                }
            ),
            Text(flag?"Do The assignment":"Watch the video "
              ,style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColorRed
              ),
            ),
          ],
        ),
      )
    );
  }


  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

}
