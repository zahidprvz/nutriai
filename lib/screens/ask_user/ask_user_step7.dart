import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep7 extends StatefulWidget {
  const AskUserStep7({Key? key}) : super(key: key);

  @override
  _AskUserStep7State createState() => _AskUserStep7State();
}

class _AskUserStep7State extends State<AskUserStep7> {
  String? _selectedGoal;
  final List<String> _goals = ['Lose Weight', 'Maintain', 'Gain Weight'];

  void _onGoalSelected(String goal) {
    setState(() {
      _selectedGoal = goal;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 7,
      totalSteps: 19,
      title: localization?.translate("ask_user_step7_title") ??
          "Quel est votre objectif ?",
      subtitle: localization?.translate("ask_user_step7_subtitle") ??
          "Cela nous aide à générer un plan pour votre apport calorique",
      content: Column(
        children: _goals.map((goal) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CardWidget(
              title: goal,
              description: '',
              icon: _getIconForGoal(goal),
              onPressed: () => _onGoalSelected(goal),
              isSelected: _selectedGoal == goal,
            ),
          );
        }).toList(),
      ),
      onNext: () {
        // Save the selected goal to your data storage (e.g., Firestore)
        if (_selectedGoal != null) {
          // Save data to Firebase here
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.updateUser(context, goal: _selectedGoal);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step8');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }

  // Helper function to get an appropriate icon for each goal
  IconData _getIconForGoal(String goal) {
    switch (goal) {
      case 'Lose Weight':
        return Icons.arrow_downward;
      case 'Maintain':
        return Icons.check_circle_outline;
      case 'Gain Weight':
        return Icons.arrow_upward;
      default:
        return Icons.help_outline;
    }
  }
}
