import 'package:flutter/material.dart';
import '../../app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "onboarding_title_1",
      "description": "onboarding_description_1",
      "image": "assets/images/onboarding1.png"
    },
    {
      "title": "onboarding_title_2",
      "description": "onboarding_description_2",
      "image": "assets/images/onboarding2.png"
    },
    {
      "title": "onboarding_title_3",
      "description": "onboarding_description_3",
      "image": "assets/images/onboarding3.png"
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() {
                _currentPage = index;
              }),
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(onboardingData[index]["image"]!),
                    const SizedBox(height: 20),
                    Text(
                      localization?.translate(onboardingData[index]["title"]!) ?? '',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      localization?.translate(onboardingData[index]["description"]!) ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _nextPage,
              child: Text(
                _currentPage == onboardingData.length - 1
                    ? localization?.translate("start") ?? 'Start'
                    : localization?.translate("next") ?? 'Next',
              ),
            ),
          ),
        ],
      ),
    );
  }
}