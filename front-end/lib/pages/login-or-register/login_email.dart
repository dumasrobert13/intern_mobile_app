import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intern_mobile_app/components/continue_button.dart';
import 'package:intern_mobile_app/components/login_textfield.dart';

class LoginEmail extends StatelessWidget {
  LoginEmail({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in function
  void signIn() {}

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
                //email
                LogInTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                //password
                LogInTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                //continue button
                ContinueButton(
                  onTap: signIn,
                ),
                const SizedBox(height: 30),
                //forgot password
                const Text('Forgot Password?'),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Don\'t have an account yet? ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: 'Register Here',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/register_email');
                            }),
                    ],
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
