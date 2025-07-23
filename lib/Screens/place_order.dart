import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Components/headr.dart';
import 'package:open_fashion/core/colors.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.total,
    required this.description,
    required this.quantity,
  });
  final String name;
  final String image;
  final double price;
  final double total;
  final String description;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headr(title: 'Checkout'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomText(
              text: 'Shipping address'.toUpperCase(),
              color: Colors.grey,
              size: 13,
            ),
          ),

          ////address flow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Iris Watson',
                  color: AppColors.primary,
                  size: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: 'Iris Watson',
                          color: Colors.black87,
                          size: 14,
                        ),
                        Gap(2),
                        CustomText(
                          text: 'Iris Watson',
                          color: Colors.black87,
                          size: 14,
                        ),
                        Gap(2),
                        CustomText(
                          text: 'Iris Watson',
                          color: Colors.black54,
                          size: 14,
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
          Gap(10),
          customContainer('Add shipping address', Icons.add, false),
        ],
      ),
    );
  }
}

Widget customContainer(title, icon, isFree) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CustomText(text: title, color: AppColors.primary),
          Spacer(),
          isFree
              ? CustomText(text: 'Free', color: AppColors.primary)
              : SizedBox.shrink(),
          Gap(10),
          Icon(icon),
        ],
      ),
    ),
  );
}
