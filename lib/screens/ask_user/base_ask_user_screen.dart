import 'package:flutter/material.dart';
import '../../app_localizations.dart';
import '../../color_scheme/color_scheme.dart';
import '../../widgets/navigation_buttons.dart';
import '../../widgets/progress_indicator_widget.dart';

class BaseAskUserScreen extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String title;
  final String subtitle;
  final Widget content;
  final VoidCallback onNext;
  final VoidCallback? onBack;

  const BaseAskUserScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.onNext,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization?.translate(title) ?? title),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressIndicatorWidget(currentStep: currentStep, totalSteps: totalSteps),
            const SizedBox(height: 16),
            Text(
              localization?.translate(subtitle) ?? subtitle,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            content,
            const Spacer(),
            NavigationButtons(
              onNext: onNext,
              onBack: onBack,
            ),
          ],
        ),
      ),
    );
  }
}