import 'package:flutter/material.dart';
import 'package:open_fashion/Components/colors.dart';
import 'package:open_fashion/Components/custom_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: true),
      backgroundColor: AppColors.primary,
    );
  }
}
