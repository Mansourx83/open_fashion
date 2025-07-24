import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.fonudSvg,
    required this.text,
    this.onTap,
    this.isBorder,
  });

  final bool fonudSvg;
  final String text;
  final void Function()? onTap;
  final BorderRadiusGeometry? isBorder;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        splashColor: Colors.white24,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withOpacity(0.95),
                AppColors.primary.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: isBorder,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.4),
                offset: Offset(0, 8),
                blurRadius: 12,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (fonudSvg)
                SvgPicture.asset(
                  'assets/svgs/shopping bag.svg',
                  width: 22,
                  color: Colors.white,
                ),
              if (fonudSvg) Gap(10),
              CustomText(
                text: text.toUpperCase(),
                size: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
