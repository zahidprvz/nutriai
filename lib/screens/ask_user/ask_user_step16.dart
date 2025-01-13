import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep16 extends StatefulWidget {
  const AskUserStep16({Key? key}) : super(key: key);

  @override
  _AskUserStep16State createState() => _AskUserStep16State();
}

class _AskUserStep16State extends State<AskUserStep16> {
  final TextEditingController _medicalConditionsController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step17');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 16,
      totalSteps: 19,
      title: "ask_user_step16_title",
      subtitle: "ask_user_step16_subtitle",
      content: InputTextWidget(
        hintText: "Medical Conditions",
        controller: _medicalConditionsController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}