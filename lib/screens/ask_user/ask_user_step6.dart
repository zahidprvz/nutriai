import 'package:flutter/material.dart';

import '../../widgets/dropdown_selector_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep6 extends StatefulWidget {
  const AskUserStep6({Key? key}) : super(key: key);

  @override
  _AskUserStep6State createState() => _AskUserStep6State();
}

class _AskUserStep6State extends State<AskUserStep6> {
  String? _selectedActivityLevel;

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step7');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 6,
      totalSteps: 19,
      title: "ask_user_step6_title",
      subtitle: "ask_user_step6_subtitle",
      content: DropdownSelectorWidget(
        hintText: "Select Activity Level",
        items: ["Sedentary", "Lightly Active", "Moderately Active", "Very Active"],
        selectedItem: _selectedActivityLevel,
        onChanged: (value) {
          setState(() {
            _selectedActivityLevel = value;
          });
        },
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}