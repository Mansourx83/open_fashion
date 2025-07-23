import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/custom_button.dart';
import 'package:open_fashion/Components/headr.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';

  String expiryDate = '';

  String cardName = '';

  String cvvCode = '';
  final _key = GlobalKey<FormState>();
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(isBlack: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Headr(title: 'Payment method'),
              Gap(10),
              ////Visa
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardName,
                cvvCode: cvvCode,
                showBackView: isShow,
                onCreditCardWidgetChange: (v) {},
                cardBgColor: Colors.black,
                isHolderNameVisible: true,
              ),
              ////form
              CreditCardForm(
                formKey: _key,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardName,
                cvvCode: cvvCode,
                onCreditCardModelChange: onCreditCardModelChange,
                isCardHolderNameUpperCase: true,
              ),
              SizedBox(height: 180),

              ///button
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(fonudSvg: false, text: 'add card'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }
}
