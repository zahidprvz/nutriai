import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep2 extends StatefulWidget {
  const AskUserStep2({Key? key}) : super(key: key);

  @override
  _AskUserStep2State createState() => _AskUserStep2State();
}

class _AskUserStep2State extends State<AskUserStep2> {
  String? _selectedWorkoutsPerWeek;

  void _onOptionSelected(String value) {
    setState(() {
      _selectedWorkoutsPerWeek = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 2,
      totalSteps: 19,
      title: localization?.translate("ask_user_step2_title") ??
          "Combien de séances d'entraînement faites-vous par semaine ?",
      subtitle: localization?.translate("ask_user_step2_subtitle") ??
          "Cela nous aidera à calibrer votre plan personnalisé",
      content: Column(
        children: [
          CardWidget(
            title: '0 - 2',
            description: '',
            icon: Icons.fitness_center,
            onPressed: () => _onOptionSelected('0 - 2'),
            isSelected: _selectedWorkoutsPerWeek == '0 - 2',
          ),
          const SizedBox(height: 16),
          CardWidget(
            title: '3 - 5',
            description: '',
            icon: Icons.fitness_center,
            onPressed: () => _onOptionSelected('3 - 5'),
            isSelected: _selectedWorkoutsPerWeek == '3 - 5',
          ),
          const SizedBox(height: 16),
          CardWidget(
            title: '6+',
            description: '',
            icon: Icons.fitness_center,
            onPressed: () => _onOptionSelected('6+'),
            isSelected: _selectedWorkoutsPerWeek == '6+',
          ),
        ],
      ),
      onNext: () {
        if (_selectedWorkoutsPerWeek != null) {
          // Save the selected value to UserProvider
          Provider.of<UserProvider>(context, listen: false)
              .updateUser(context, workoutsPerWeek: _selectedWorkoutsPerWeek);

          Navigator.pushNamed(context, '/ask_user_step3');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
