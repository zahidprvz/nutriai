import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep10 extends StatefulWidget {
  const AskUserStep10({Key? key}) : super(key: key);

  @override
  _AskUserStep10State createState() => _AskUserStep10State();
}

class _AskUserStep10State extends State<AskUserStep10> {
  final TextEditingController _dietaryRestrictionsController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step11');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 10,
      totalSteps: 19,
      title: "ask_user_step10_title",
      subtitle: "ask_user_step10_subtitle",
      content: InputTextWidget(
        hintText: "Dietary Restrictions",
        controller: _dietaryRestrictionsController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}
