import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep14 extends StatefulWidget {
  const AskUserStep14({Key? key}) : super(key: key);

  @override
  _AskUserStep14State createState() => _AskUserStep14State();
}

class _AskUserStep14State extends State<AskUserStep14> {
  List<String> _selectedAccomplishments = [];
  final Map<String, IconData> _accomplishments = {
    'Eat and live healthier': Icons.restaurant,
    'Boost my energy and mood': Icons.emoji_emotions,
    'Stay motivated': Icons.star,
    'Feel better about my body': Icons.self_improvement,
  };

  void _onAccomplishmentSelected(String accomplishment) {
    setState(() {
      if (_selectedAccomplishments.contains(accomplishment)) {
        _selectedAccomplishments.remove(accomplishment);
      } else {
        _selectedAccomplishments.add(accomplishment);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 14,
      totalSteps: 19,
      title: localization?.translate("ask_user_step14_title") ??
          "Que souhaitez-vous accomplir ?",
      subtitle: "",
      content: Column(
        children: _accomplishments.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CardWidget(
              title: entry.key,
              description: '',
              icon: entry.value,
              onPressed: () => _onAccomplishmentSelected(entry.key),
              isSelected: _selectedAccomplishments.contains(entry.key),
            ),
          );
        }).toList(),
      ),
      onNext: () {
        // Save selected accomplishments to your data storage (e.g., Firestore)
        if (_selectedAccomplishments.isNotEmpty) {
          // Save data to Firebase here
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.updateUser(context,
              accomplishments: _selectedAccomplishments);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step15');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
