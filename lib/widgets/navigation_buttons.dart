import 'package:flutter/material.dart';
import '../../color_scheme/color_scheme.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onNext;

  const NavigationButtons({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center( // Center the button horizontally
      child: ElevatedButton(
        onPressed: onNext,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size.fromHeight(50), // Set minimum height
        ),
        child: const Text(
          "Suivant",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}