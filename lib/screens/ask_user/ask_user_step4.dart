import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep4 extends StatefulWidget {
  const AskUserStep4({Key? key}) : super(key: key);

  @override
  _AskUserStep4State createState() => _AskUserStep4State();
}

class _AskUserStep4State extends State<AskUserStep4> {
  final TextEditingController _heightController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step5');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 4,
      totalSteps: 19,
      title: "ask_user_step4_title",
      subtitle: "ask_user_step4_subtitle",
      content: InputTextWidget(
        hintText: "Height (cm)",
        controller: _heightController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}