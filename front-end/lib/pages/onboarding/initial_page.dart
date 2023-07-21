import 'package:flutter/material.dart';
import 'package:intern_mobile_app/pages/onboarding/preference_screen1.dart';
import 'package:intern_mobile_app/pages/onboarding/preference_screen2.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0, viewportFraction: 0.7);

  void _goToNextScreen() {
    if (_pageController.page! < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
  void _back() {
    if (_pageController.page! < 2) {
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
          PreferenceScreen1(onPreferenceSelected: _goToNextScreen),
          PreferenceScreen2(onPreferenceSelected: _back),
          // Add more preference screens as needed
        ],
      ),
    );
  }
}
