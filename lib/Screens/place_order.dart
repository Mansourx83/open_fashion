import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/address_display.dart';
import 'package:open_fashion/Components/cart.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/custom_button.dart';
import 'package:open_fashion/Components/custom_text.dart';
import 'package:open_fashion/Components/headr.dart';
import 'package:open_fashion/Components/shipping_method.dart';
import 'package:open_fashion/Screens/add_address.dart';
import 'package:open_fashion/Screens/add_card.dart';
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
  dynamic _savedcardData;
  late int selectedQty;
  @override
  void initState() {
    selectedQty = widget.quantity;
    super.initState();
  }

  ///Address Data
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

  void _editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddAddress(editData: _savedAddress);
        },
      ),
    );

    setState(() {
      _savedAddress = newAddress;
    });
  }

  ///Card Data
  void _openCard(context) async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddCard();
        },
      ),
    );
    if (cardData != null) {
      setState(() {
        _savedcardData = cardData;
      });
    }
  }

  void _editCard() async {
    final newCard = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddCard(editData: _savedcardData);
        },
      ),
    );

    setState(() {
      _savedcardData = newCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headr(title: 'Checkout'),
          _savedAddress != null && _savedcardData != null
              ? SizedBox.shrink()
              : Padding(
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
                    ? AddressInfo(
                        savedAddress: _savedAddress,
                        onTap: _editAddress,
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
          _savedAddress == null && _savedcardData == null
              ? ShippingMethod()
              : SizedBox.shrink(),
          ////Payment Method
          _savedAddress != null && _savedcardData != null
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomText(
                    text: 'Payment method'.toUpperCase(),
                    color: Colors.grey,
                    size: 14,
                  ),
                ),
          Gap(10),
          _savedcardData != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () => _editCard(),
                    child: Column(
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Gap(20),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/Mastercard.svg",
                              width: 38,
                            ),
                            Gap(10),
                            CustomText(
                              text: "Master Card Ending",
                              color: Colors.black,
                              size: 14,
                            ),
                            Gap(10),
                            CustomText(
                              text:
                                  "••••${_savedcardData['number'].toString().substring(_savedcardData['number'].length - 2)}",
                              color: Colors.black,
                              size: 14,
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/svgs/arrow.svg"),
                            Gap(10),
                          ],
                        ),
                        Gap(20),
                        Divider(color: Colors.grey.shade300),
                      ],
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () => _openCard(context),
                  child: customContainer(
                    'select payment method',
                    Icons.keyboard_arrow_down,
                    false,
                  ),
                ),
          /////Cart Widget if have data
          Gap(20),
          _savedAddress != null && _savedcardData != null
              ? Cart(
                  name: widget.name,
                  image: widget.image,
                  price: widget.price,
                  description: widget.description,
                  onCanged: (quantity) {
                    setState(() {
                      selectedQty = quantity;
                    });
                  },
                  qty: widget.quantity,
                )
              : SizedBox.shrink(),
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
                  text: "\$ ${((widget.price * selectedQty).round())}",
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
