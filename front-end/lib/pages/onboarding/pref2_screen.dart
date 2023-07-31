import 'package:flutter/material.dart';

import '../../components/onboarding_header.dart';

class Pref2Screen extends StatelessWidget {
  final VoidCallback onPreferenceSelected;

  const Pref2Screen({super.key, required this.onPreferenceSelected});


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
          child: OnboardHeader(header: 'May your partner make funny but spicy jokes?', currentPage: '6',)
        ),
      ),
    );
  }
}
