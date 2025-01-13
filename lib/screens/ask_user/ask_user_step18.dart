import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep18 extends StatefulWidget {
  const AskUserStep18({Key? key}) : super(key: key);

  @override
  _AskUserStep18State createState() => _AskUserStep18State();
}

class _AskUserStep18State extends State<AskUserStep18> {
  final TextEditingController _allergiesController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step19');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 18,
      totalSteps: 19,
      title: "ask_user_step18_title",
      subtitle: "ask_user_step18_subtitle",
      content: InputTextWidget(
        hintText: "Allergies",
        controller: _allergiesController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}