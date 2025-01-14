import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep1 extends StatefulWidget {
  const AskUserStep1({Key? key}) : super(key: key);

  @override
  _AskUserStep1State createState() => _AskUserStep1State();
}

class _AskUserStep1State extends State<AskUserStep1> {
  String? _selectedGender;

  void _onGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 1,
      totalSteps: 19,
      title: localization?.translate("ask_user_step1_title") ??
          "Choisissez votre genre",
      subtitle: localization?.translate("ask_user_step1_subtitle") ??
          "Cela sera utilisé pour calibrer votre plan personnalisé",
      content: Column(
        children: [
          CardWidget(
            title: localization?.translate("gender_male") ?? 'Homme',
            description: '',
            icon: Icons.male,
            onPressed: () => _onGenderSelected('Homme'),
            isSelected: _selectedGender == 'Homme',
          ),
          const SizedBox(height: 16),
          CardWidget(
            title: localization?.translate("gender_female") ?? 'Femme',
            description: '',
            icon: Icons.female,
            onPressed: () => _onGenderSelected('Femme'),
            isSelected: _selectedGender == 'Femme',
          ),
          const SizedBox(height: 16),
          CardWidget(
            title: localization?.translate("gender_other") ?? 'Autre',
            description: '',
            icon: Icons.person_outline,
            onPressed: () => _onGenderSelected('Autre'),
            isSelected: _selectedGender == 'Autre',
          ),
        ],
      ),
      onNext: () {
        if (_selectedGender != null) {
          // Save the selected gender to UserProvider
          Provider.of<UserProvider>(context, listen: false)
              .updateUser(context, gender: _selectedGender);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step2');
        }
      },
    );
  }
}
