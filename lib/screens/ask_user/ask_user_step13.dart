import 'package:flutter/material.dart';

import '../../widgets/dropdown_selector_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep13 extends StatefulWidget {
  const AskUserStep13({Key? key}) : super(key: key);

  @override
  _AskUserStep13State createState() => _AskUserStep13State();
}

class _AskUserStep13State extends State<AskUserStep13> {
  String? _selectedStressLevel;

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step14');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 13,
      totalSteps: 19,
      title: "ask_user_step13_title",
      subtitle: "ask_user_step13_subtitle",
      content: DropdownSelectorWidget(
        hintText: "Select Stress Level",
        items: ["Low", "Moderate", "High"],
        selectedItem: _selectedStressLevel,
        onChanged: (value) {
          setState(() {
            _selectedStressLevel = value;
          });
        },
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}