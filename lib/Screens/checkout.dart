import 'package:flutter/material.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/headr.dart';

class Checkout extends StatelessWidget {
  const Checkout({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
  final String name;
  final String image;
  final double price;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Column(children: [
        Headr(title: 'Checkout'),
      
      ]),
    );
  }
}
