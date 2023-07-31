// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class OnboardHeader extends StatelessWidget {
  final String currentPage;
  final String header;
  final String? subheader;

  const OnboardHeader(
      {super.key, required this.currentPage, required this.header, this.subheader});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentPage,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        if (subheader != null) // Conditionally show the subheader if it's not null
          Text(
            subheader!,
            style: const TextStyle(fontSize: 10),
          ),
      ],
    );
  }
}
