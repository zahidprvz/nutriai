import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isPrimary ? Colors.white : Colors.black,
        backgroundColor: isPrimary ? Colors.blue : Colors.grey[300],
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}