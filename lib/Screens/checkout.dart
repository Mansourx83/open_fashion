import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/cart.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Components/headr.dart';
import 'package:open_fashion/Components/quantity.dart';
import 'package:open_fashion/core/colors.dart';

class Checkout extends StatefulWidget {
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
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Headr(title: 'Checkout'),
            Cart(
              name: widget.name,
              image: widget.image,
              price: widget.price,
              description: widget.description,
            ),
          ],
        ),
      ),
    );
  }
}
