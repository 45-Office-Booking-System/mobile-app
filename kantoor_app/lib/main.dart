import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/auth_screen.dart';
import 'package:kantoor_app/screens/onboarding/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final skipAuth = prefs.getBool('skipAuth') ?? false;

  runApp(MyApp(skipAuth: skipAuth));
}

class MyApp extends StatelessWidget {
  final bool skipAuth;
  const MyApp({
    Key? key,
    required this.skipAuth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kantoor App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: skipAuth ? const AuthScreen() : SplashScreen(),
    );
  }
}
