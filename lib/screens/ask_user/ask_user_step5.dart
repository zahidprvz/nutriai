import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep5 extends StatefulWidget {
  const AskUserStep5({Key? key}) : super(key: key);

  @override
  _AskUserStep5State createState() => _AskUserStep5State();
}

class _AskUserStep5State extends State<AskUserStep5> {
  final TextEditingController _weightController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step6');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 5,
      totalSteps: 19,
      title: "ask_user_step5_title",
      subtitle: "ask_user_step5_subtitle",
      content: InputTextWidget(
        hintText: "Weight (kg)",
        controller: _weightController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}