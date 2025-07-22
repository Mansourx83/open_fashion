import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Components/quantity.dart';
import 'package:open_fashion/core/colors.dart';

class Cart extends StatefulWidget {
  const Cart({
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
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, width: 150),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              text: widget.name.toUpperCase(),
              spacing: 4,
              color: AppColors.primary,
            ),
            Gap(10),
            SizedBox(
              width: size.width * 0.54,
              child: CustomText(
                text: widget.description.toUpperCase(),
                color: Colors.grey,
                size: 11,
                maxline: 1,
              ),
            ),
            Gap(30),
            Row(
              children: [
                Quantity(
                  onTap: () {
                    setState(() {
                      if (number > 1) {
                        number--;
                      }
                    });
                  },
                  svg: 'assets/svgs/min.svg',
                ),
                Gap(12),
                CustomText(
                  text: number.toString(),
                  size: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                Gap(12),
                Quantity(
                  onTap: () {
                    setState(() {
                      number++;
                    });
                  },
                  svg: 'assets/svgs/plus.svg',
                ),
              ],
            ),
            Gap(30),
            CustomText(
              text: "\$ ${widget.price.toString()}",
              color: const Color.fromARGB(189, 239, 154, 154),
              size: 20,
            ),
          ],
        ),
      ],
    );
  }
}
