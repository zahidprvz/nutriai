import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep8 extends StatefulWidget {
  const AskUserStep8({Key? key}) : super(key: key);

  @override
  _AskUserStep8State createState() => _AskUserStep8State();
}

class _AskUserStep8State extends State<AskUserStep8> {
  final TextEditingController _goalWeightController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step9');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 8,
      totalSteps: 19,
      title: "ask_user_step8_title",
      subtitle: "ask_user_step8_subtitle",
      content: InputTextWidget(
        hintText: "Goal Weight (kg)",
        controller: _goalWeightController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}