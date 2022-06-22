import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/auth/auth_screen.dart';
import 'package:kantoor_app/screens/main/home/home_screen.dart';
import 'package:kantoor_app/screens/onboarding/onboarding_screen.dart';
import 'package:kantoor_app/viewModels/screen_index_value.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScreenIndexProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kantoor App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: skipAuth ? const HomeScreen() : const HomeScreen(),
      ),
    );
  }
}
