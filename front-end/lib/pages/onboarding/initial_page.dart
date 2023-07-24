import 'package:flutter/material.dart';
import 'package:intern_mobile_app/pages/onboarding/age_screen.dart';
import 'package:intern_mobile_app/pages/onboarding/avatar_screen.dart';
import 'package:intern_mobile_app/pages/onboarding/gender_screen.dart';
import 'package:intern_mobile_app/pages/onboarding/interest_screen.dart';
import 'package:intern_mobile_app/pages/onboarding/pref1_screen.dart';
import 'package:intern_mobile_app/pages/onboarding/pref2_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.7);

  void _goToNextScreen() {
    if (_pageController.page! < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _back() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          AgeScreen(onPreferenceSelected: _goToNextScreen),
          GenderScreen(onPreferenceSelected: _goToNextScreen),
          AvatarScreen(onPreferenceSelected: _goToNextScreen),
          Pref1Screen(onPreferenceSelected: _goToNextScreen),
          Pref2Screen(onPreferenceSelected: _goToNextScreen),
          InterestScreen(onPreferenceSelected: _goToNextScreen)
          // Add more preference screens as needed
        ],
      ),
    );
  }
}
