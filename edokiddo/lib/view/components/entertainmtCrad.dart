import 'package:edokiddo/const/appColor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class GameCard extends StatelessWidget {

  String urls;
  String name;

  GameCard({
    required this.name,
    required this.urls
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        var url = Uri.parse(urls);
        await _launchUniversalLinkIos(url);
      },
      child: Card(
        child: ListTile(
          leading: Image.asset("assets/images/game-modified.png"),
          title: Text(name.toString(),
            style: TextStyle(
                fontSize: 25,
                color:Colors.black87
            )
            ,),
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
