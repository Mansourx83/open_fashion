import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.fonudSvg, required this.text, this.onTap});
  final bool fonudSvg;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    bool isSvg = fonudSvg;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.primary),
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? SvgPicture.asset('assets/svgs/shopping bag.svg', width: 20)
                : SizedBox.shrink(),
            Gap(8),
            CustomText(text: text.toUpperCase(), size: 16),
          ],
        ),
      ),
    );
  }
}
