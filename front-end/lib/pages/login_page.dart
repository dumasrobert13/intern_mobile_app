import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/log-in/bg-image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.3, 1.0],
                  colors: [
                    Color.fromARGB(240, 29, 11, 42),
                    Color.fromARGB(37, 15, 54, 0),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Image.asset(
                    'lib/assets/images/log-in/logo.png',
                    height: 168,
                    width: 209,
                  ),
                  //create an account or log in

                  //continue with email

                  //terms of service
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
