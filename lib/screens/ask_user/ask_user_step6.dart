import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import 'base_ask_user_screen.dart';

class AskUserStep6 extends StatefulWidget {
  const AskUserStep6({Key? key}) : super(key: key);

  @override
  _AskUserStep6State createState() => _AskUserStep6State();
}

class _AskUserStep6State extends State<AskUserStep6> {
  DateTime _selectedDate = DateTime.now(); // Initially set to today's date

  void _showCupertinoDatePicker(BuildContext context) {
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
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime(
                      2000, 1, 1), // Default or previously selected date
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 6,
      totalSteps: 19,
      title: localization?.translate("ask_user_step6_title") ??
          "Quand êtes-vous né(e) ?",
      subtitle: localization?.translate("ask_user_step6_subtitle") ??
          "Cela nous aide à personnaliser votre expérience",
      content: Center(
        // Center the button
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showCupertinoDatePicker(context),
              child: Text(
                _selectedDate != null
                    ? "${localization?.translate("date") ?? "Date"}: ${_selectedDate.toIso8601String().split('T')[0]}"
                    : localization?.translate("select_birth_date") ??
                        "Sélectionner votre date de naissance",
              ),
            ),
            if (_selectedDate != null) ...[
              const SizedBox(height: 8),
              Text(
                "${localization?.translate("selected_date") ?? "Date sélectionnée"}: ${_selectedDate.toIso8601String().split('T')[0]}",
              ),
            ],
          ],
        ),
      ),
      onNext: () {
        // Save birth date to your data storage (e.g., Firestore)
        if (_selectedDate != null) {
          // Save data to Firebase here
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.updateUser(context, birthDate: _selectedDate);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step7');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
