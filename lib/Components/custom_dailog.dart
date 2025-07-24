import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Screens/home.dart';

import 'custom_button.dart';
import 'custom_text.dart';

class CustomDailog extends StatelessWidget {
  const CustomDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.clear),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Gap(20),
            CustomText(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
              size: 19,
            ),
            Image.asset(
              'assets/svgs/line.png',
              width: 200,
              color: Colors.black,
            ),
            Gap(30),
            SvgPicture.asset("assets/pop/done.svg", width: 60),
            Gap(20),
            CustomText(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
              size: 19,
            ),
            Gap(20),
            CustomText(
              text: "Payment ID 15263541".toUpperCase(),
              color: Colors.black,
              size: 14,
            ),
            Gap(20),
            Image.asset(
              "assets/svgs/line.png",
              color: Colors.black,
              width: 120,
            ),
            Gap(10),
            CustomText(
              text: "Rate your purchase".toUpperCase(),
              color: Colors.black,
              size: 19,
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/pop/emogi1.svg"),
                Gap(20),
                SvgPicture.asset("assets/pop/emogi2.svg"),
                Gap(20),
                SvgPicture.asset("assets/pop/emogi3.svg"),
              ],
            ),
            Gap(20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    fonudSvg: false,
                    text: "Submit",
                    onTap: () {
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Home()),
                      //   (Route<dynamic> route) => false,
                      // );
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Gap(20),
                Expanded(
                  child: CustomButton(
                    fonudSvg: false,
                    text: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
