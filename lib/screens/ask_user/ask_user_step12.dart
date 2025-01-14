import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';
import '../../widgets/card_widget.dart';
import 'base_ask_user_screen.dart';

class AskUserStep12 extends StatefulWidget {
  const AskUserStep12({Key? key}) : super(key: key);

  @override
  _AskUserStep12State createState() => _AskUserStep12State();
}

class _AskUserStep12State extends State<AskUserStep12> {
  List<String> _selectedReasons = [];
  final Map<String, IconData> _reasons = {
    'Lack of consistency': Icons.event_busy,
    'Unhealthy eating habits': Icons.fastfood,
    'Lack of support': Icons.people,
    'Busy schedule': Icons.schedule,
    'Lack of meal inspiration': Icons.restaurant_menu,
  };

  void _onReasonSelected(String reason) {
    setState(() {
      if (_selectedReasons.contains(reason)) {
        _selectedReasons.remove(reason);
      } else {
        _selectedReasons.add(reason);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BaseAskUserScreen(
      currentStep: 12,
      totalSteps: 19,
      title: localization?.translate("ask_user_step12_title") ??
          "Qu'est-ce qui vous empêche d'atteindre vos objectifs ?",
      subtitle: "",
      content: Column(
        children: _reasons.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CardWidget(
              title: entry.key,
              description: '',
              icon: entry.value,
              onPressed: () => _onReasonSelected(entry.key),
              isSelected: _selectedReasons.contains(entry.key),
            ),
          );
        }).toList(),
      ),
      onNext: () {
        // Save selected reasons to your data storage (e.g., Firestore)
        if (_selectedReasons.isNotEmpty) {
          // Save data to Firebase here
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.updateUser(context,
              reasonsForNotReachingGoals: _selectedReasons);

          // Navigate to the next step
          Navigator.pushNamed(context, '/ask_user_step13');
        }
      },
      onBack: () => Navigator.pop(context),
    );
  }
}
