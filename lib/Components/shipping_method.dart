import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Screens/place_order.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40),
          ////Shipping Method
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomText(
              text: 'Shipping Method'.toUpperCase(),
              color: Colors.grey,
              size: 14,
            ),
          ),
          const Gap(10),
          customContainer('Pickup at store', Icons.keyboard_arrow_down, true),
          const Gap(40),
      ],
    );
  }
}