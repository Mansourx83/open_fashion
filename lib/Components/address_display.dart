import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/core/colors.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({super.key, this.savedAddress, this.onTap});
  final dynamic savedAddress;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: '${savedAddress['firstName']} ${savedAddress['lastName']}',
              color: AppColors.primary,
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: savedAddress['address'],
              color: Colors.black87,
              size: 14,
            ),
            Gap(2),
            CustomText(
              text: savedAddress['city'],
              color: Colors.black87,
              size: 14,
            ),
            Gap(2),
            CustomText(
              text: savedAddress['phone'],
              color: Colors.black54,
              size: 14,
            ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ),
      ],
    );
  }
}
