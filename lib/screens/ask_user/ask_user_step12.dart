import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep12 extends StatefulWidget {
  const AskUserStep12({Key? key}) : super(key: key);

  @override
  _AskUserStep12State createState() => _AskUserStep12State();
}

class _AskUserStep12State extends State<AskUserStep12> {
  final TextEditingController _sleepDurationController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step13');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 12,
      totalSteps: 19,
      title: "ask_user_step12_title",
      subtitle: "ask_user_step12_subtitle",
      content: InputTextWidget(
        hintText: "Sleep Duration (hours)",
        controller: _sleepDurationController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}