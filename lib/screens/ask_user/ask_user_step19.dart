import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import 'base_ask_user_screen.dart';

class AskUserStep19 extends StatelessWidget {
  const AskUserStep19({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 19,
      totalSteps: 19,
      title: localization?.translate("ask_user_step19_title") ??
          "Création de votre plan",
      subtitle: "",
      content: const Center(
        child: CircularProgressIndicator(), // Show a loading indicator
      ),
      onNext: () async {
        // Simulate plan creation
        await Future.delayed(const Duration(seconds: 3));

        // Update the isRegistered flag in the UserProvider
        Provider.of<UserProvider>(context, listen: false)
            .completeRegistration();

        // Navigate to the home screen
        Navigator.pushReplacementNamed(context, '/home');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
