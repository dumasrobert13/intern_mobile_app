import 'package:flutter/material.dart';

import '../../components/onboarding_header.dart';

class GenderScreen extends StatelessWidget {
  final VoidCallback onPreferenceSelected;

  const GenderScreen({super.key, required this.onPreferenceSelected});


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
          child: OnboardHeader(header: 'How do you identify yourself?', currentPage: '3',)
        ),
      ),
    );
  }
}
