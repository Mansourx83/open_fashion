import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/about_section.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Models/covers_model.dart';
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

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      Gap(120),
                      Image.asset('assets/cover/cover1.png'),
                      Gap(20),

                      // GridView for products
                      GridView.builder(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: ProductModel.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.50,
                        ),
                        itemBuilder: (context, index) {
                          final item = ProductModel.products[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(item.image),
                              Gap(10),
                              CustomText(text: item.name),
                              CustomText(
                                text: item.description,
                                size: 12,
                                color: Colors.grey,
                              ),
                              CustomText(
                                text: "\$ ${item.price.toString()}",
                                color: const Color.fromARGB(189, 239, 154, 154),
                              ),
                            ],
                          );
                        },
                      ),

                      CustomText(
                        text: 'You may also like'.toUpperCase(),
                        fontWeight: FontWeight.bold,
                        size: 24,
                      ),
                      Image.asset('assets/svgs/line.png', width: 200),

                      Gap(40),

                      // ListView for covers
                      SizedBox(
                        height: 370,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: CoversModel.covers.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = CoversModel.covers[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(item.image, height: 300),
                                  Gap(8),
                                  CustomText(
                                    text: item.title.toUpperCase(),
                                    size: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Gap(20),

                      /////About Section Widget
                      AboutSection(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 12),
                    child: Center(
                      child: CustomText(
                        text: 'Copyright© OpenUI All Rights Reserved.',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

