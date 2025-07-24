import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/cart.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/custom_button.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Components/headr.dart';
import 'package:open_fashion/Components/quantity.dart';
import 'package:open_fashion/Screens/place_order.dart';
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
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Column(
        children: [
          Headr(title: 'Checkout'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Cart(
              name: widget.name,
              image: widget.image,
              price: widget.price,
              description: widget.description,
              onCanged: (v) {
                setState(() {
                  selectedValue = v;
                });
              },
              qty: selectedValue,
            ),
          ),
          promo(),
          Gap(8),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Est. Total'.toUpperCase(),
                  spacing: 3,
                  size: 14,
                  color: AppColors.primary,
                ),
                CustomText(
                  text: "\$ ${((widget.price * selectedValue).round())}",
                  color: const Color.fromARGB(189, 239, 154, 154),
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Gap(8),
          CustomButton(
            fonudSvg: true,
            text: 'Checkout',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PlaceOrder(
                      name: widget.name,
                      image: widget.image,
                      price: widget.price,
                      total: widget.price * selectedValue,
                      description: widget.description,
                      quantity: selectedValue,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget promo() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0),
    child: Column(
      children: [
        Gap(20),
        Divider(),
        Gap(8),
        Row(
          children: [
            Gap(20),
            SvgPicture.asset('assets/svgs/promo.svg', width: 25),
            Gap(20),
            CustomText(
              text: 'Add promo code',
              size: 14,
              color: AppColors.primary,
            ),
          ],
        ),
        Gap(8),
        Divider(),
        Gap(8),
        Row(
          children: [
            Gap(20),
            SvgPicture.asset('assets/svgs/delivery.svg', width: 25),
            Gap(20),
            CustomText(text: 'Delivery', size: 14, color: AppColors.primary),
            Spacer(),
            CustomText(text: 'free', size: 14, color: AppColors.primary),
          ],
        ),
        Gap(8),
        Divider(),
      ],
    ),
  );
}
