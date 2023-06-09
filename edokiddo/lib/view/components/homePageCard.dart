import 'package:edokiddo/const/appColor.dart';
import 'package:edokiddo/view/screens/EducationScreen.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';

class CustomPromotionCard extends StatelessWidget {
  const CustomPromotionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: appPadding, right: appPadding),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EducationScreen()));
        },
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: size.width,
              height: size.width * .425,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColorRed,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: 29.0,
                      color: secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Container(
                    width: size.width * .425,
                    child: Text(
                      "Your Best way to Learn",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: secondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
               SizedBox(height: 15,)
                ],
              ),
            ),
            Positioned(
              top: 1.0,
              right: 20.0,
              child: Container(
                height: size.width * .4,
                child: Image.asset("assets/images/dog_reading_vector.png")
              ),
            ),
          ],
        ),
      ),
    );
  }
}
