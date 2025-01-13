import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onBack;

  const NavigationButtons({
    Key? key,
    required this.onNext,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (onBack != null)
          ElevatedButton(
            onPressed: onBack,
            child: const Text("Précédent"),
          ),
        const Spacer(),
        ElevatedButton(
          onPressed: onNext,
          child: const Text("Suivant"),
        ),
      ],
    );
  }
}