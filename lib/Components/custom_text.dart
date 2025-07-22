import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.maxline = 1,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.spacing = 1,
  });
  final String text;
  final double size;
  final double spacing;
  final int maxline;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      style: TextStyle(
        letterSpacing: spacing,
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        fontFamily: "TenorSans",
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
