import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/view/screens/lecDetails.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
class LecCard extends StatelessWidget {

  String urls;
  String name;

  LecCard({
    required this.name,
    required this.urls
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LecDetails(urls)));
      },
      child: Card(
        child: ListTile(
          leading: Image.asset("assets/images/dog_reading_vector.png"),
          title: Text("Lecture "+name.toString(),
            style: TextStyle(
                fontSize: 25,
                color:Colors.black87
            ),
          ),
        ),

        color: AppColors.primaryColorGray,
      ),
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
