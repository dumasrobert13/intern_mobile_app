import 'package:flutter/material.dart';

class GenderChoice extends StatelessWidget {
  const GenderChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: 116,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(196, 196, 196, 0.6),
        borderRadius: BorderRadius.all(Radius.circular(37)),
      ),
    );
  }
}
