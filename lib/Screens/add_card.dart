import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_button.dart';
import 'package:open_fashion/Components/headr.dart';
import 'package:open_fashion/core/colors.dart';
import '../components/custom_appbar.dart';
import 'package:open_fashion/Models/user_data.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key, this.editData});
  final dynamic editData;

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // إذا كانت البيانات موجودة، قم بملء المتغيرات بالقيم الموجودة.
    if (widget.editData != null) {
      setState(() {
        cardNumber = widget.editData['number'] ?? '';
        cardHolderName = widget.editData['name'] ?? '';
        expiryDate = widget.editData['date'] ?? '';
        cvvCode = widget.editData['cvv'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(isBlack: false),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  (UserData.firstName != null && UserData.lastName != null)
                      ? '${UserData.firstName} ${UserData.lastName}'
                      : 'User Name',
                ),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/vec/user.jpg'),
                ),
                decoration: BoxDecoration(color: AppColors.primary),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Address: ${UserData.address ?? "Address"}'),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text('City: ${UserData.city ?? "City"}'),
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('State: ${UserData.state ?? "State"}'),
              ),
              ListTile(
                leading: Icon(Icons.markunread_mailbox),
                title: Text('ZIP Code: ${UserData.zipCode ?? "ZIP Code"}'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone: ${UserData.phone ?? "Phone"}'),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Headr(title: "Payment method"),
                Gap(0),

                /// visa card
                CreditCardWidget(
                  padding: 4,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Colors.black,
                  obscureCardCvv: true,
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                ),

                Gap(20),

                /// form
                CreditCardForm(
                  formKey: _key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                  obscureCvv: false,
                  inputConfiguration: InputConfiguration(
                    cardNumberTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cardNumberDecoration: InputDecoration(
                      hintText: "Card Number",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cardHolderTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cardHolderDecoration: InputDecoration(
                      hintText: "Card Name",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cvvCodeTextStyle: TextStyle(fontFamily: "TenorSans"),
                    cvvCodeDecoration: InputDecoration(
                      hintText: "CVV",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    expiryDateTextStyle: TextStyle(fontFamily: "TenorSans"),
                    expiryDateDecoration: InputDecoration(
                      hintText: "Expiry Date",
                      hintStyle: TextStyle(fontFamily: "TenorSans"),
                      counterStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Gap(70),
                CustomButton(
                  isBorder: BorderRadius.circular(24),
                  fonudSvg: false,
                  text: "ADD CARD",
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      final data = {
                        'number': cardNumber,
                        'name': cardHolderName,
                        'date': expiryDate,
                        'cvv': cvvCode,
                      };

                      Navigator.pop(context, data);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }
}
