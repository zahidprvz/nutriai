import 'package:flutter/material.dart';

import '../../widgets/dropdown_selector_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep9 extends StatefulWidget {
  const AskUserStep9({Key? key}) : super(key: key);

  @override
  _AskUserStep9State createState() => _AskUserStep9State();
}

class _AskUserStep9State extends State<AskUserStep9> {
  String? _selectedTimeline;

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step10');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 9,
      totalSteps: 19,
      title: "ask_user_step9_title",
      subtitle: "ask_user_step9_subtitle",
      content: DropdownSelectorWidget(
        hintText: "Select Timeline",
        items: ["1 Month", "3 Months", "6 Months", "1 Year"],
        selectedItem: _selectedTimeline,
        onChanged: (value) {
          setState(() {
            _selectedTimeline = value;
          });
        },
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}