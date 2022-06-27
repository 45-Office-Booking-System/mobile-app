import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/onboarding/splash_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/location_selected_value.dart';
import 'package:kantoor_app/viewModels/screen_index_value.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScreenIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationSelectedProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kantoor App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: colorWhite,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
