import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep13 extends StatefulWidget {
  const AskUserStep13({Key? key}) : super(key: key);

  @override
  _AskUserStep13State createState() => _AskUserStep13State();
}

class _AskUserStep13State extends State<AskUserStep13> {
  String? _selectedDiet;
  final List<String> _diets = ['Classic', 'Pescatarian', 'Vegetarian', 'Vegan'];

  void _onDietSelected(String diet) {
    setState(() {
      _selectedDiet = diet;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 13,
      totalSteps: 19,
      title: localization?.translate("ask_user_step13_title") ??
          "Suivez-vous un régime alimentaire spécifique ?",
      subtitle: "",
      content: Column(
        children: _diets.map((diet) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CardWidget(
              title: diet,
              description: '',
              icon: Icons.food_bank, // You can customize icons
              onPressed: () => _onDietSelected(diet),
              isSelected: _selectedDiet == diet,
            ),
          );
        }).toList(),
      ),
      onNext: () {
        // Save the selected diet to your data storage (e.g., Firestore)
        if (_selectedDiet != null) {
          // Save data to Firebase here
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.updateUser(context, diet: _selectedDiet);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step14');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
