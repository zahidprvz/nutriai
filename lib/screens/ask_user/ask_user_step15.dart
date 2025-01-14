import 'package:flutter/material.dart';
import '../../app_localizations.dart';
import 'base_ask_user_screen.dart';

class AskUserStep15 extends StatelessWidget {
  const AskUserStep15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 15,
      totalSteps: 19,
      title: localization?.translate("ask_user_step15_title") ??
          "Vous avez un grand potentiel pour atteindre votre objectif",
      subtitle: "",
      content: Center(
        child: Image.asset(
          'assets/images/graph-2.png', // Replace with your actual image path
          // You can add more styling to the image if needed
        ),
      ),
      onNext: () {
        Navigator.pushNamed(context, '/ask_user_step16');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
