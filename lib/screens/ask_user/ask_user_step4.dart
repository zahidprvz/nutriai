import 'package:flutter/material.dart';
import '../../app_localizations.dart';
import 'base_ask_user_screen.dart';

class AskUserStep4 extends StatelessWidget {
  const AskUserStep4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 4,
      totalSteps: 19,
      title: localization?.translate("ask_user_step4_title") ??
          "Nutri AI crée des résultats à long terme",
      subtitle: "", // No subtitle for this step
      content: Column(
        children: [
          Image.asset(
            'assets/images/graph-3.png', // Replace with your actual image path
          ),
          const SizedBox(height: 16),
          Text(
            localization?.translate("ask_user_step4_description") ??
                "Nutri AI s'appuie sur des méthodes scientifiquement prouvées pour vous aider à atteindre vos objectifs de manière durable.",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      onNext: () {
        Navigator.pushNamed(context, '/ask_user_step5');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
