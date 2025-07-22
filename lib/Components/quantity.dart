import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Quantity extends StatelessWidget {
  const Quantity({super.key, required this.onTap, required this.svg});
  final void Function()? onTap;
  final String svg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400, width: 1),
        ),
        child: SvgPicture.asset(svg),
      ),
    );
    ;
  }
}
