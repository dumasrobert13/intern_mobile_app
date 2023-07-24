import 'package:flutter/material.dart';
import 'package:intern_mobile_app/components/onboarding_header.dart';

class AgeScreen extends StatelessWidget {
  final VoidCallback onPreferenceSelected;

  const AgeScreen({super.key, required this.onPreferenceSelected});

  // Implement the UI for the first preference screen here

  void _onPreferenceSelected() {
    // Perform any necessary actions based on the user's preference selection
    // For example, you might save the user's preference and then call the callback to move to the next screen:
    // saveUserPreference(selectedPreference);
    onPreferenceSelected();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21),
        child: Center(
          child: OnboardHeader(header: 'How old are you?', currentPage: '2', subheader: 'We want to make sure you are on a legal age',)
        ),
      ),
    );
  }
}
