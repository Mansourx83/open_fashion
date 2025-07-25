import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Components/custom_appbar.dart';
import 'package:open_fashion/Components/custom_button.dart';
import 'package:open_fashion/Components/custom_textfiled.dart';
import 'package:open_fashion/Components/headr.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/Models/user_data.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key, this.editData});
  final dynamic editData;
  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editData != null) {
      _firstNameController.text = widget.editData['firstName'] ?? '';
      _lastNameController.text = widget.editData['lastName'] ?? '';
      _addressController.text = widget.editData['address'] ?? '';
      _cityController.text = widget.editData['city'] ?? '';
      _stateController.text = widget.editData['state'] ?? '';
      _zipCodeController.text = widget.editData['zipCode'] ?? '';
      _phoneNumberController.text = widget.editData['phone'] ?? '';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headr(title: 'Add shipping address'),
              Gap(30),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'First name',
                              controller: _firstNameController,
                              focusNode: FocusNode(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First name is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Gap(10),
                          Expanded(
                            child: CustomTextField(
                              label: 'Last name',
                              controller: _lastNameController,
                              focusNode: FocusNode(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Last name is required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Gap(10),

                      // Address field
                      CustomTextField(
                        label: 'Address',
                        controller: _addressController,
                        focusNode: FocusNode(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                          return null;
                        },
                      ),
                      Gap(10),

                      // City field
                      CustomTextField(
                        label: 'City',
                        controller: _cityController,
                        focusNode: FocusNode(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'City is required';
                          }
                          return null;
                        },
                      ),
                      Gap(10),

                      // Row with State and ZIP code
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'State',
                              controller: _stateController,
                              focusNode: FocusNode(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'State is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Gap(10),
                          Expanded(
                            child: CustomTextField(
                              label: 'ZIP Code',
                              controller: _zipCodeController,
                              focusNode: FocusNode(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ZIP Code is required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Gap(10),

                      // Phone number field
                      CustomTextField(
                        label: 'Phone Number',
                        controller: _phoneNumberController,
                        max: 11,
                        focusNode: FocusNode(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone Number is required';
                          }
                          return null;
                        },
                      ),
                      Gap(80),
                      // Save button
                      CustomButton(
                        fonudSvg: false,
                        text: 'Add now',
                        isBorder: BorderRadius.circular(24),
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final data = {
                              "firstName": _firstNameController.text,
                              "lastName": _lastNameController.text,
                              "address": _addressController.text,
                              "city": _cityController.text,
                              "state": _stateController.text,
                              "zipCode": _zipCodeController.text,
                              "phone": _phoneNumberController.text,
                              "imagePath": 'assets/cover/cover1.png',
                            };
                            UserData.setAddressData(data);
                            Navigator.pop(context, data);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
