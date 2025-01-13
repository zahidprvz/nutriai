import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressIndicatorWidget({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Étape $currentStep sur $totalSteps",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: currentStep / totalSteps,
          backgroundColor: Colors.grey[300],
          color: Colors.blue,
        ),
      ],
    );
  }
}