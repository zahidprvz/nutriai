import 'package:flutter/material.dart';

import '../../widgets/dropdown_selector_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep7 extends StatefulWidget {
  const AskUserStep7({Key? key}) : super(key: key);

  @override
  _AskUserStep7State createState() => _AskUserStep7State();
}

class _AskUserStep7State extends State<AskUserStep7> {
  String? _selectedDiet;

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step8');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 7,
      totalSteps: 19,
      title: "ask_user_step7_title",
      subtitle: "ask_user_step7_subtitle",
      content: DropdownSelectorWidget(
        hintText: "Select Diet",
        items: ["Vegetarian", "Vegan", "Pescatarian", "Omnivore"],
        selectedItem: _selectedDiet,
        onChanged: (value) {
          setState(() {
            _selectedDiet = value;
          });
        },
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}