import 'package:flutter/material.dart';
import '../../app_localizations.dart';
import 'base_ask_user_screen.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class AskUserStep16 extends StatefulWidget {
  const AskUserStep16({Key? key}) : super(key: key);

  @override
  _AskUserStep16State createState() => _AskUserStep16State();
}

class _AskUserStep16State extends State<AskUserStep16> {
  double _rating = 4.0; // Initial rating value

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 16,
      totalSteps: 19,
      title: localization?.translate("ask_user_step16_title") ??
          "Donnez-nous une note",
      subtitle: localization?.translate("ask_user_step16_subtitle") ??
          "Nous aimerions connaître votre opinion",
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothStarRating(
              allowHalfRating: false,
              onRatingChanged: (v) {
                setState(() {
                  _rating = v;
                });
              },
              starCount: 5,
              rating: _rating,
              size: 40.0,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              color: Colors.amber,
              borderColor: Colors.amber,
              spacing: 0.0,
            ),
            const SizedBox(height: 16),
            Text(
              "${localization?.translate("rating") ?? "Note"}: ${_rating.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      onNext: () {
        // Save the rating to your data storage or send it to your feedback system
        // ...

        Navigator.pushNamed(context, '/ask_user_step17');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
