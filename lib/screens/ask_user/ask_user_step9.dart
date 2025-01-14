import 'package:flutter/material.dart';
import 'package:nutriai/models/user.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import 'base_ask_user_screen.dart';

class AskUserStep9 extends StatefulWidget {
  const AskUserStep9({Key? key}) : super(key: key);

  @override
  _AskUserStep9State createState() => _AskUserStep9State();
}

class _AskUserStep9State extends State<AskUserStep9> {
  void _nextStep() {
    // Navigate to the next step
    Navigator.pushNamed(context, '/ask_user_step10');
  }

  String _getSuccessMessage(BuildContext context, UserData user) {
    var localization = AppLocalizations.of(context);
    String message = '';

    // Customize messages based on user data
    if (user.goal == 'Lose Weight') {
      if (user.workoutsPerWeek == '0 - 2') {
        message = localization
                ?.translate("ask_user_step9_lose_weight_low_workout") ??
            "75% des utilisateurs perdent du poids avec un plan adapté et un suivi régulier.";
      } else if (user.workoutsPerWeek == '3 - 5') {
        message = localization
                ?.translate("ask_user_step9_lose_weight_medium_workout") ??
            "85% des utilisateurs atteignent leurs objectifs de perte de poids avec un programme d'exercices régulier.";
      } else if (user.workoutsPerWeek == '6+') {
        message = localization
                ?.translate("ask_user_step9_lose_weight_high_workout") ??
            "92% des utilisateurs constatent une perte de poids significative et durable avec un engagement élevé dans leur plan.";
      }
    } else if (user.goal == 'Gain Weight') {
      message = localization?.translate("ask_user_step9_gain_weight") ??
          "Avec un plan nutritionnel adapté, prendre du poids sainement est tout à fait réalisable.";
    } else {
      // Maintain
      message = localization?.translate("ask_user_step9_maintain_weight") ??
          "Maintenir son poids est facile avec un suivi régulier et une alimentation équilibrée.";
    }

    return message;
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final currentWeight = user.weight ?? 0.0;
    final desiredWeight = user.desiredWeight ?? 0.0;
    final weightDifference = (currentWeight - desiredWeight).abs();
    final weightDifferenceFormatted = weightDifference.toStringAsFixed(1);

    return BaseAskUserScreen(
      currentStep: 9,
      totalSteps: 19,
      title: localization?.translate("ask_user_step9_title") ?? "Étape 9",
      subtitle: localization?.translate("ask_user_step9_subtitle") ?? "",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${localization?.translate("ask_user_step9_content_title") ?? "Perdre"} $weightDifferenceFormatted kg ${localization?.translate("ask_user_step9_content_title2") ?? "est un objectif réaliste. Ce n’est pas difficile du tout !"}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            _getSuccessMessage(context, user),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      onNext: _nextStep,
      onBack: () => Navigator.pop(context),
    );
  }
}
