import 'package:flutter/material.dart';

import '../../widgets/dropdown_selector_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep15 extends StatefulWidget {
  const AskUserStep15({Key? key}) : super(key: key);

  @override
  _AskUserStep15State createState() => _AskUserStep15State();
}

class _AskUserStep15State extends State<AskUserStep15> {
  String? _selectedAlcoholConsumption;

  void _nextStep() {
    // Save data to Firebase
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step16');
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 15,
      totalSteps: 19,
      title: "ask_user_step15_title",
      subtitle: "ask_user_step15_subtitle",
      content: DropdownSelectorWidget(
        hintText: "Select Alcohol Consumption",
        items: ["Non-Drinker", "Occasional Drinker", "Regular Drinker"],
        selectedItem: _selectedAlcoholConsumption,
        onChanged: (value) {
          setState(() {
            _selectedAlcoholConsumption = value;
          });
        },
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}
