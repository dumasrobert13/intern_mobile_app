import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_mobile_app/components/login_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:intern_mobile_app/http_request/api_service.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatelessWidget {
  // this logger is like a console.log on js
  static final Logger logger = Logger();
  const LoginPage({super.key, required String title});

// Login with Google.
  Future<String> loginUserWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: '303559538310-a4jqf81agjem14ufmrgpv536k4kiaejs.apps.googleusercontent.com',
      scopes: ['email']);

    try {
      final GoogleSignInAccount? googleUser =
          await googleSignIn.signIn();
          logger.d(googleUser);
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String idToken = googleAuth.idToken!;

        // Make an HTTP request to your Node.js backend
        final String customToken =
            await APIService.loginUserWithGoogle(idToken);
        return customToken;
      } else {
        throw Exception('Google Sign-In canceled');
      }
    } catch (e, stackTrace) {
      logger.e('Login with Google failed', e, stackTrace);
    }
    throw Exception('Login with Google failed');
  }

// Login with Facebook
  Future<String> loginUserWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final String accessToken = result.accessToken!.token;

        // Make an HTTP request to your Node.js backend
        final String customToken =
            await APIService.loginUserWithFacebook(accessToken);
        return customToken;
      }
    } catch (e, stackTrace) {
      logger.e('Login with Facebook failed', e, stackTrace);
    }
    throw Exception('Login with Facebook failed');
  }

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
                    Color.fromARGB(0, 37, 15, 54),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //logo and subtitle
                  SvgPicture.asset(
                    'lib/assets/images/log-in/logo.svg',
                    height: 168,
                    width: 209,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Find a Romance',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //continue with email
                  const SizedBox(height: 66),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Column(
                      children: [
                        const Text(
                          'Create an account or login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 10),
                        //button for google
                        LoginButton(
                          text: 'Continue with Google',
                          onPressed: loginUserWithGoogle,
                          logo: 'lib/assets/images/log-in/google.png',
                        ),
                        const SizedBox(height: 10),
                        //button for facebook
                        LoginButton(
                          text: 'Continue with Facebook',
                          onPressed: loginUserWithFacebook,
                          logo: 'lib/assets/images/log-in/facebook.png',
                        ),
                        const SizedBox(height: 10),
                        //button for email
                        LoginButton(
                          text: 'Continue with Email',
                          onPressed: () {},
                          logo: 'lib/assets/images/log-in/email.png',
                        ),
                        const SizedBox(height: 29),
                        const Text(
                          'By signing up, you agree to our Terms of Service and Privacy Policy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 47),
                      ],
                    ),
                  ),
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
