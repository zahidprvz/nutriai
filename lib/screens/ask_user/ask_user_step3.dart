import 'package:flutter/material.dart';

import '../../widgets/dropdown_selector_widget.dart';
import 'base_ask_user_screen.dart';


class AskUserStep3 extends StatefulWidget {
  const AskUserStep3({Key? key}) : super(key: key);

  @override
  _AskUserStep3State createState() => _AskUserStep3State();
}

class _AskUserStep3State extends State<AskUserStep3> {
  String? _selectedGender;

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step4');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 3,
      totalSteps: 19,
      title: "ask_user_step3_title",
      subtitle: "ask_user_step3_subtitle",
      content: DropdownSelectorWidget(
        hintText: "Select Gender",
        items: ["Male", "Female", "Other"],
        selectedItem: _selectedGender,
        onChanged: (value) {
          setState(() {
            _selectedGender = value;
          });
        },
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}

