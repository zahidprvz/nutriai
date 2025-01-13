import 'package:flutter/material.dart';

import '../../widgets/input_text_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep17 extends StatefulWidget {
  const AskUserStep17({Key? key}) : super(key: key);

  @override
  _AskUserStep17State createState() => _AskUserStep17State();
}

class _AskUserStep17State extends State<AskUserStep17> {
  final TextEditingController _medicationsController = TextEditingController();

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step18');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 17,
      totalSteps: 19,
      title: "ask_user_step17_title",
      subtitle: "ask_user_step17_subtitle",
      content: InputTextWidget(
        hintText: "Medications",
        controller: _medicationsController,
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}
