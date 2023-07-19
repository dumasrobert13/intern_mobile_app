import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {

  final Function()? onTap;

  const ContinueButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320,
        height: 50,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.center, colors: [
            Color.fromRGBO(255, 9, 180, 1),
            Color.fromRGBO(90, 0, 247, 1)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(37)),
        ),
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
          child: const Text(
            'Continue',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
