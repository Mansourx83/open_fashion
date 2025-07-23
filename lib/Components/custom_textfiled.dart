import 'package:flutter/material.dart';
import 'package:open_fashion/core/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isEnabled;
  final String? Function(String?)? validator;  

   const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    this.isEnabled = true,
    this.validator,  
  });

  InputDecoration _buildInputDecoration(FocusNode focusNode) {
    return InputDecoration(
      hintText: label,
      hintStyle: TextStyle(color: Colors.grey, fontFamily: 'TenorSans'),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: _buildInputDecoration(focusNode),
        enabled: isEnabled,
        validator: validator,
      ),
    );
  }
}
