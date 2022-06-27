import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/auth_screen.dart';
import 'package:kantoor_app/screens/main/main_screen.dart';
import 'package:kantoor_app/screens/onboarding/onboarding_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    final prefs = await SharedPreferences.getInstance();
    final skipOnBoarding = prefs.getBool('skipOnBoarding') ?? false;
    final skipAuth = prefs.getBool('skipAuth') ?? false;

    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          if (skipOnBoarding == false) {
            return const OnboardingScreen();
          } else if (skipAuth == false) {
            return const AuthScreen();
          } else {
            return const MainScreen();
          }
        },
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startSplashScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/logo.png"),
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Kantoor',
                    style: titleTextStyle.copyWith(color: primaryColor500),
                  ),
                  Text(
                    'menyewa gedung mudah dan aman',
                    style: subtitleTextStyle.copyWith(color: primaryColor500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
