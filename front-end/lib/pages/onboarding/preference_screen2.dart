import 'package:flutter/material.dart';

class PreferenceScreen2 extends StatelessWidget {
  final VoidCallback onPreferenceSelected;

  const PreferenceScreen2({super.key, required this.onPreferenceSelected});

  // Implement the UI for the first preference screen here

  void _onPreferenceSelected() {
    // Perform any necessary actions based on the user's preference selection
    // For example, you might save the user's preference and then call the callback to move to the next screen:
    // saveUserPreference(selectedPreference);
    onPreferenceSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: TextButton(
            onPressed: _onPreferenceSelected,
            child: const Text(
              'previous page',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
