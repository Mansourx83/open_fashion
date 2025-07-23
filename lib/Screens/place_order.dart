import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/custom_button.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Components/headr.dart';
import 'package:open_fashion/Screens/add_address.dart';
import 'package:open_fashion/core/colors.dart';

class PlaceOrder extends StatefulWidget {
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
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;

  void _openAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddAddress();
        },
      ),
    );
    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void _editAddress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddAddress(editData: _savedAddress);
        },
      ),
    );
  }

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
              size: 14,
            ),
          ),

          ////address flow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _savedAddress != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    '${_savedAddress['firstName']}${_savedAddress['lastName']}',
                                color: AppColors.primary,
                                size: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: _savedAddress['address'],
                                color: Colors.black87,
                                size: 14,
                              ),
                              Gap(2),
                              CustomText(
                                text: _savedAddress['city'],
                                color: Colors.black87,
                                size: 14,
                              ),
                              Gap(2),
                              CustomText(
                                text: _savedAddress['phone'],
                                color: Colors.black54,
                                size: 14,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              return _editAddress();
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Gap(10),
          _savedAddress == null
              ? GestureDetector(
                  onTap: () {
                    return _openAddress(context);
                  },
                  child: customContainer(
                    'Add shipping address',
                    Icons.add,
                    false,
                  ),
                )
              : SizedBox.shrink(),
          Gap(40),
          ////Shipping Method
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomText(
              text: 'Shipping Method'.toUpperCase(),
              color: Colors.grey,
              size: 14,
            ),
          ),
          Gap(10),
          customContainer('Pickup at store', Icons.keyboard_arrow_down, true),
          Gap(40),
          ////Payment Method
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomText(
              text: 'Payment method'.toUpperCase(),
              color: Colors.grey,
              size: 14,
            ),
          ),
          Gap(10),
          customContainer(
            'select payment method',
            Icons.keyboard_arrow_down,
            false,
          ),
          Spacer(),
          ////total row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Total'.toUpperCase(),
                  spacing: 3,
                  size: 15,
                  color: AppColors.primary,
                ),
                CustomText(
                  text: "\$ ${widget.total.round()}",
                  color: const Color.fromARGB(189, 239, 154, 154),
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Gap(8),
          ////place order butten
          CustomButton(fonudSvg: true, text: 'Place order'),
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
