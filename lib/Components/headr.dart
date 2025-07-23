import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';

class Headr extends StatelessWidget {
  const Headr({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Center(
          child: CustomText(
            text: title.toUpperCase(),
            fontWeight: FontWeight.bold,
            size: 18,
            color: AppColors.primary,
            spacing: 10,
          ),
        ),
        Image.asset('assets/svgs/line.png', width: 200, color: Colors.black),
        Gap(20),
      ],
    );
  }
}
