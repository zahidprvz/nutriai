import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep10 extends StatefulWidget {
  const AskUserStep10({Key? key}) : super(key: key);

  @override
  _AskUserStep10State createState() => _AskUserStep10State();
}

class _AskUserStep10State extends State<AskUserStep10> {
  double _gainPerWeek = 0.5; // Initial value (in kg)
  String? _message;

  void _updateMessage(BuildContext context) {
    var localization = AppLocalizations.of(context);
    if (_gainPerWeek <= 0.1) {
      _message = localization?.translate("ask_user_step10_message_slow") ??
          "Lent et régulier";
    } else if (_gainPerWeek <= 0.8) {
      _message =
          localization?.translate("ask_user_step10_message_recommended") ??
              "Recommandé";
    } else {
      _message = localization?.translate("ask_user_step10_message_fast") ??
          "Vous pourriez vous sentir très fatigué(e) et développer une peau flasque";
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize _message using context-dependent AppLocalizations
    _updateMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 10,
      totalSteps: 19,
      title: localization?.translate("ask_user_step10_title") ??
          "À quelle vitesse souhaitez-vous atteindre votre objectif ?",
      subtitle: localization?.translate("ask_user_step10_subtitle") ??
          "Gain de poids par semaine",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch horizontally
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '$_gainPerWeek kg',
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add horizontal padding
            child: Slider(
              value: _gainPerWeek,
              min: 0.1,
              max: 1.5,
              divisions: 28, // (1.5 - 0.1) / 0.05 = 28 divisions
              label: _gainPerWeek.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _gainPerWeek = value;
                  _updateMessage(context);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add horizontal padding
            child: CardWidget(
              title: _message ?? '',
              description: '',
              icon: Icons.fitness_center,
              onPressed:
                  () {}, // No action needed, as the slider updates the value
              isSelected: true, // Highlight this card
            ),
          ),
          const SizedBox(height: 20), // Add some space at the bottom
        ],
      ),
      onNext: () {
        // Save desired weight to your data storage (e.g., Firestore)
        if (_gainPerWeek != null) {
          // Save data to Firebase here
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.updateUser(context, gainPerWeek: _gainPerWeek);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step11');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
