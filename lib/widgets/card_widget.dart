// Update CardWidget to include isSelected and apply styling
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color_scheme/color_scheme.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;

  const CardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: isSelected ? Colors.white : AppColors.primaryColor),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: isSelected ? Colors.white : Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}