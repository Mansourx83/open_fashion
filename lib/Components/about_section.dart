import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_fashion/Components/custom_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Ionicons.logo_twitter, color: Colors.white),
              Gap(16),
              Icon(Ionicons.logo_facebook, color: Colors.white),
              Gap(16),
              Icon(Ionicons.logo_instagram, color: Colors.white),
            ],
          ),
          Gap(20),
          Image.asset('assets/svgs/line.png', width: 150),
          Gap(20),
          Text(
            'support@openui.design \n        +60 825 876 \n 08:00 - 22:00 - Everyday ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              height: 2.2,
              fontFamily: "TenorSans",
            ),
          ),
          Gap(20),
          Image.asset('assets/svgs/line.png', width: 150),
          Gap(20),
          CustomText(text: 'About       Contact       Blog '),
          Gap(40),

          Gap(20),
        ],
      ),
    );
  }
}
