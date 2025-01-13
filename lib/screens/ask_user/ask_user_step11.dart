import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep11 extends StatefulWidget {
  const AskUserStep11({Key? key}) : super(key: key);

  @override
  _AskUserStep11State createState() => _AskUserStep11State();
}

class _AskUserStep11State extends State<AskUserStep11> {
  final TextEditingController _waterIntakeController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step12');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 11,
      totalSteps: 19,
      title: "ask_user_step11_title",
      subtitle: "ask_user_step11_subtitle",
      content: InputTextWidget(
        hintText: "Water Intake (liters)",
        controller: _waterIntakeController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}