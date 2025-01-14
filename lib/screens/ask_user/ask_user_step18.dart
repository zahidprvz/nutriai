import 'package:flutter/material.dart';
import 'package:nutriai/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import 'base_ask_user_screen.dart';

class AskUserStep18 extends StatefulWidget {
  const AskUserStep18({Key? key}) : super(key: key);

  @override
  _AskUserStep18State createState() => _AskUserStep18State();
}

class _AskUserStep18State extends State<AskUserStep18> {
  @override
  void initState() {
    super.initState();
    // Start the animation when the screen is loaded
    _startAnimation();
  }

  void _startAnimation() async {
    // Add your animation logic here (e.g., using a package like 'sprinkle')
    // ...

    // Simulate some delay for the animation
    await Future.delayed(const Duration(seconds: 3));

    // Update the isRegistered flag in the UserProvider
    // Provider.of<UserProvider>(context, listen: false).completeRegistration();

    // Navigate to the next step after the animation
    // Navigator.pushReplacementNamed(context, '/ask_user_step19');
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 18,
      totalSteps: 19,
      title: localization?.translate("ask_user_step18_title") ??
          "Merci de nous faire confiance",
      subtitle: localization?.translate("ask_user_step18_subtitle") ??
          "Nous promettons de toujours garder vos informations personnelles privées et sécurisées.",
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your animation widget here (e.g., using 'sprinkle' or any other animation package)
            // Example using a simple text animation:
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 2),
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: Text(
                    localization?.translate("congratulations") ??
                        "Félicitations!",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      onNext: () {
        // Update the isRegistered flag in the UserProvider
        Provider.of<UserProvider>(context, listen: false)
            .completeRegistration();

        Navigator.pushNamed(context, '/ask_user_step19');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
