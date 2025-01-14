import 'package:flutter/material.dart';
import '../../app_localizations.dart';
import 'base_ask_user_screen.dart';

class AskUserStep11 extends StatelessWidget {
  const AskUserStep11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 11,
      totalSteps: 19,
      title: localization?.translate("ask_user_step11_title") ??
          "Perdez deux fois plus de poids avec Nutri AI que par vous-même",
      subtitle: "",
      content: Center(
        child: Image.asset(
          'assets/images/graph-1.png', // Replace with your actual image path
          // You can add more styling to the image if needed
        ),
      ),
      onNext: () {
        Navigator.pushNamed(context, '/ask_user_step12');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
