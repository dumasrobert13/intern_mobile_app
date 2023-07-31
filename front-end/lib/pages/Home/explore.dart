import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('EXPLORE'),
            ElevatedButton(
              onPressed: () => context.goNamed('onBoarding'),
              child: const Text('OnBoarding'),
            ),
            ElevatedButton(
              onPressed: () => context.goNamed('login'),
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
