import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import 'base_ask_user_screen.dart';

class AskUserStep8 extends StatefulWidget {
  const AskUserStep8({Key? key}) : super(key: key);

  @override
  _AskUserStep8State createState() => _AskUserStep8State();
}

class _AskUserStep8State extends State<AskUserStep8> {
  double _desiredWeight = 70.0; // Initial value

  void _showWeightPicker(BuildContext context) {
    double selectedValue = _desiredWeight;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 300.0,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Annuler',
                        style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Valider'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                      initialItem:
                          selectedValue.toInt() - 40), // Adjust range as needed
                  itemExtent: 40.0,
                  onSelectedItemChanged: (int index) {
                    selectedValue =
                        (index + 40).toDouble(); // Adjust range as needed
                  },
                  children: List<Widget>.generate(161, (int index) {
                    // 40 kg to 200 kg
                    return Center(
                      child: Text(
                        '${index + 40}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    ).then((_) {
      setState(() {
        _desiredWeight = selectedValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 8,
      totalSteps: 19,
      title: localization?.translate("ask_user_step8_title") ??
          "Choisissez votre poids désiré",
      subtitle: localization?.translate("ask_user_step8_subtitle") ??
          "Gagnez du poids, puis utilisez le sélecteur de nombre",
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showWeightPicker(context),
              child: Text(
                _desiredWeight != null
                    ? "${localization?.translate("weight") ?? "Poids"}: ${_desiredWeight} kg"
                    : localization?.translate("select_weight") ??
                        "Sélectionner le poids",
              ),
            ),
            if (_desiredWeight != null) ...[
              const SizedBox(height: 8),
              Text(
                "${localization?.translate("selected_weight") ?? "Poids sélectionné"}: ${_desiredWeight} kg",
              ),
            ],
          ],
        ),
      ),
      onNext: () {
        // Save desired weight to your data storage (e.g., Firestore)
        if (_desiredWeight != null) {
          // Save data to Firebase here
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.updateUser(context, desiredWeight: _desiredWeight);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step9');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
