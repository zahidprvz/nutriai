import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep2 extends StatefulWidget {
  const AskUserStep2({Key? key}) : super(key: key);

  @override
  _AskUserStep2State createState() => _AskUserStep2State();
}

class _AskUserStep2State extends State<AskUserStep2> {
  final TextEditingController _ageController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step3');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 2,
      totalSteps: 19,
      title: "ask_user_step2_title",
      subtitle: "ask_user_step2_subtitle",
      content: InputTextWidget(
        hintText: "Age",
        controller: _ageController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}