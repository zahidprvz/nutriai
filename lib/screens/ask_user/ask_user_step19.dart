import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep19 extends StatefulWidget {
  const AskUserStep19({Key? key}) : super(key: key);

  @override
  _AskUserStep19State createState() => _AskUserStep19State();
}

class _AskUserStep19State extends State<AskUserStep19> {
  final TextEditingController _fitnessGoalsController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the home screen
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 19,
      totalSteps: 19,
      title: "ask_user_step19_title",
      subtitle: "ask_user_step19_subtitle",
      content: InputTextWidget(
        hintText: "Fitness Goals",
        controller: _fitnessGoalsController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}