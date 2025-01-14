import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import 'base_ask_user_screen.dart';

class AskUserStep5 extends StatefulWidget {
  const AskUserStep5({Key? key}) : super(key: key);

  @override
  _AskUserStep5State createState() => _AskUserStep5State();
}

class _AskUserStep5State extends State<AskUserStep5> {
  double _height = 170; // Initial height (in cm)
  double _weight = 70; // Initial weight (in kg)

  void _showHeightPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 300.0,
          color: Colors.white,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              setState(() {
                _height = (index + 100)
                    .toDouble(); // Assuming minimum height is 100 cm
              });
            },
            children: List<Widget>.generate(151, (int index) {
              // 100 cm to 250 cm
              return Center(
                child: Text(
                  '${index + 100} cm',
                  // Removed the custom TextStyle to use the default theme style
                ),
              );
            }),
          ),
        );
      },
    );
  }

  void _showWeightPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 300.0,
          color: Colors.white,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              setState(() {
                _weight =
                    (index + 40).toDouble(); // Assuming minimum weight is 40 kg
              });
            },
            children: List<Widget>.generate(161, (int index) {
              // 40 kg to 200 kg
              return Center(
                child: Text(
                  '${index + 40} kg',
                  // Removed the custom TextStyle to use the default theme style
                ),
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 5,
      totalSteps: 19,
      title:
          localization?.translate("ask_user_step5_title") ?? "Taille et poids",
      subtitle: localization?.translate("ask_user_step5_subtitle") ??
          "Cela nous aidera à calibrer votre plan personnalisé",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _showHeightPicker(context),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: localization?.translate("height") ?? 'Taille',
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(
                '$_height cm',
                // Removed the custom TextStyle to use the default theme style
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _showWeightPicker(context),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: localization?.translate("weight") ?? 'Poids',
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(
                '$_weight kg',
                // Removed the custom TextStyle to use the default theme style
              ),
            ),
          ),
        ],
      ),
      onNext: () {
        // Save height and weight to UserProvider
        Provider.of<UserProvider>(context, listen: false)
            .updateUser(context, height: _height, weight: _weight);

        Navigator.pushNamed(context, '/ask_user_step6');
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
