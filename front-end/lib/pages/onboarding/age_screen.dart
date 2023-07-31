import 'package:flutter/material.dart';
import 'package:intern_mobile_app/components/onboarding_header.dart';

class AgeScreen extends StatelessWidget {
  final VoidCallback onPreferenceSelected;

  const AgeScreen({super.key, required this.onPreferenceSelected});


  void _onPreferenceSelected() {
    // Perform any necessary actions based on the user's preference selection
    // For example, you might save the user's preference and then call the callback to move to the next screen:
    // saveUserPreference(selectedPreference);
    onPreferenceSelected();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    // The user picked a date.
    if (picked != null && picked != DateTime.now()) {
      // Do something with the selected date.
      _onPreferenceSelected();
      print(
          "Selected date: ${picked.toLocal()}"); // You can replace this with your desired action.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const OnboardHeader(
                header: 'How old are you?',
                currentPage: '2',
                subheader: 'We want to make sure you are on a legal age',
              ),
              const SizedBox(height: 21),
              TextFormField(
                onTap: () => _selectDate(context),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Choose yor birthday',
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
