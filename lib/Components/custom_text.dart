import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.maxline = 1,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final double size;
  final int maxline;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        fontFamily: "TenorSans",
      ),
    );
  }
}
