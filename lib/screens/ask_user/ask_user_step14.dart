import 'package:flutter/material.dart';

import '../../widgets/dropdown_selector_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep14 extends StatefulWidget {
  const AskUserStep14({Key? key}) : super(key: key);

  @override
  _AskUserStep14State createState() => _AskUserStep14State();
}

class _AskUserStep14State extends State<AskUserStep14> {
  String? _selectedSmokingHabit;

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step15');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 14,
      totalSteps: 19,
      title: "ask_user_step14_title",
      subtitle: "ask_user_step14_subtitle",
      content: DropdownSelectorWidget(
        hintText: "Select Smoking Habit",
        items: ["Non-Smoker", "Occasional Smoker", "Regular Smoker"],
        selectedItem: _selectedSmokingHabit,
        onChanged: (value) {
          setState(() {
            _selectedSmokingHabit = value;
          });
        },
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}
