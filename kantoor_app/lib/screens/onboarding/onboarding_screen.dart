import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/auth_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              const Image(
                image: AssetImage('assets/images/logo.png'),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("skipOnBoarding", true);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const AuthScreen();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return primaryColor700;
                        }
                        return primaryColor500;
                      },
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: subtitleTextStyle.copyWith(fontSize: 16, color: colorWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
