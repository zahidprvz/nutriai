import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPass;
  final TextInputType textInputType;

  const InputTextWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPass = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Use the controller here
      obscureText: isPass,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
