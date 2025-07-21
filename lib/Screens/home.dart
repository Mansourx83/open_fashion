import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Models/product_model.dart';
import 'package:open_fashion/core/colors.dart';
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

      body: Stack(
        children: [
          ///// Texts
          Positioned(
            top: 10,
            left: 0,
            right: 0,

            child: SvgPicture.asset("assets/texts/10.svg"),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/October.svg"),
          ),
          Positioned(
            top: 85,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/Collection.svg"),
          ),

          Column(
            children: [
              Gap(120),
              Image.asset('assets/cover/cover1.png'),
              Gap(20),
              GridView.builder(
                itemCount: ProductModel.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final item = ProductModel.products[index];
                  Column(
                    children: [
                      Image.asset(item.image),
                      Gap(10),
                      CustomText(text: item.name),
                      CustomText(text: item.description),
                      CustomText(text: item.price.toString()),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
