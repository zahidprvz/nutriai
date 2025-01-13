import 'package:flutter/material.dart';

import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep1 extends StatefulWidget {
  const AskUserStep1({Key? key}) : super(key: key);

  @override
  _AskUserStep1State createState() => _AskUserStep1State();
}

class _AskUserStep1State extends State<AskUserStep1> {
  String? _selectedGender; // Store the selected gender

  void _onGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseAskUserScreen(
      currentStep: 1,
      totalSteps: 19,
      title: "Choisissez votre genre",
      subtitle: "Cela sera utilisé pour calibrer votre plan personnalisé",
      content: Column(
        children: [
          CardWidget(
            title: 'Homme',
            description: '',
            icon: Icons.male,
            onPressed: () => _onGenderSelected('Homme'),
            isSelected: _selectedGender == 'Homme',
          ),
          const SizedBox(height: 16),
          CardWidget(
            title: 'Femme',
            description: '',
            icon: Icons.female,
            onPressed: () => _onGenderSelected('Femme'),
            isSelected: _selectedGender == 'Femme',
          ),
          const SizedBox(height: 16),
          CardWidget(
            title: 'Autre',
            description: '',
            icon: Icons.person_outline,
            onPressed: () => _onGenderSelected('Autre'),
            isSelected: _selectedGender == 'Autre',
          ),
        ],
      ),
      onNext: () {
        // Proceed to the next step only if a gender is selected
        if (_selectedGender != null) {
          // Save the selected gender (e.g., to Firebase)
          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step2');
        }
      },
    );
  }
}