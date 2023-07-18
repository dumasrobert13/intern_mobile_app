import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterLogin extends StatelessWidget {
  const RegisterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 55.0),
          child: Center(
            child: Column(
              children: [
                const Text('0 of 7'),
                const SizedBox(height: 50),
                SvgPicture.asset(
                  'lib/assets/images/log-in/logo-black.svg',
                  height: 168,
                  width: 213,
                ),
                const SizedBox(height: 62),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Fill out your details below to continue.',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 21),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
