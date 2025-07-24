import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/Screens/search_screen.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlack});
  final bool isBlack;
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: AppBar(
        backgroundColor: isBlack ? AppColors.primary : Colors.white,
        leadingWidth: 25,
        leading: SvgPicture.asset(
          "assets/svgs/Menu.svg",
          color: isBlack ? Colors.white : AppColors.primary,
        ),
        title: SvgPicture.asset(
          "assets/logo/logo-bg.svg",
          color: isBlack ? Colors.white : AppColors.primary,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            child: SvgPicture.asset(
              "assets/svgs/Search.svg",
              color: isBlack ? Colors.white : AppColors.primary,
            ),
          ),
          Gap(20),
          SvgPicture.asset(
            "assets/svgs/shopping bag.svg",
            color: isBlack ? Colors.white : AppColors.primary,
          ),
        ],
      ),
    );
  }
}
