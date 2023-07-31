import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intern_mobile_app/components/continue_button.dart';
import 'package:intern_mobile_app/components/login_textfield.dart';

class RegisterEmail extends StatelessWidget {
  RegisterEmail({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

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
                SvgPicture.asset(
                  'lib/assets/images/log-in/logo-black.svg',
                  height: 168,
                  width: 213,
                ),
                const SizedBox(height: 62),
                const Text(
                  'Register',
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
                const SizedBox(height: 10),
                LogInTextField(
                  controller: retypePasswordController,
                  hintText: 'Re-enter your Pasword',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                //continue button
                ContinueButton(
                  onTap: signIn,
                ),
                const SizedBox(height: 60),
                const Text(
                  'By signing up, you agree to our Terms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
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
