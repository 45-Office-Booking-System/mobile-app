import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/auth_screen.dart';
import 'package:kantoor_app/utils/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
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
