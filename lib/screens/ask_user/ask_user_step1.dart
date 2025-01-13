import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep1 extends StatefulWidget {
  const AskUserStep1({Key? key}) : super(key: key);

  @override
  _AskUserStep1State createState() => _AskUserStep1State();
}

class _AskUserStep1State extends State<AskUserStep1> {
  final TextEditingController _nameController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step2');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 1,
      totalSteps: 19,
      title: "ask_user_step1_title",
      subtitle: "ask_user_step1_subtitle",
      content: InputTextWidget(
        hintText: "Name",
        controller: _nameController,
      ),
      onNext: _nextStep,
    );
  }
}