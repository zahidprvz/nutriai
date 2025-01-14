import 'package:flutter/material.dart';

import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep3 extends StatelessWidget {
  const AskUserStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 4,
      totalSteps: 19,
      title: "Nutri AI creates long-term results",
      subtitle: "",
      content: Column(
        children: [
          Image.asset(
              'assets/images/graph-3.png'), // Replace with your actual image path
          const SizedBox(height: 16),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      onNext: () {
        Navigator.pushNamed(context, '/ask_user_step5');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
