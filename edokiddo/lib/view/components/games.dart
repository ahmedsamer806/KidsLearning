import 'package:edokiddo/const/appColor.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';

class CustomPromotionCard2 extends StatelessWidget {
String imgPass;
String title;
String subTitle;
Color cr=AppColors.tiredColor;

CustomPromotionCard2({
  required this.title,
  required this.subTitle,
  required this.imgPass,
  required this.cr

}
);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: appPadding, right: appPadding),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width,
            height: size.width * .425,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: cr,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: size.width * .425,
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: secondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
          Positioned(
            top: 1.0,
            right: 20.0,
            child: Container(
                height: size.width * .35,
                child: Image.asset(imgPass)
            ),
          ),
        ],
      ),
    );
  }
}
