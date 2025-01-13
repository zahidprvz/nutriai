import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const InputTextWidget({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}