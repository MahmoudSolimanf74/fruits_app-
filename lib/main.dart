import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/views/home_screen.dart';
import 'package:fruits_app/features/auth/views/login_screen.dart';
import 'package:fruits_app/features/splash/views/splash_screen.dart';
import 'package:fruits_app/features/onboard/views/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboard': (context) => OnboardScreen(),
        '/login': (context) => LoginScreen(),
        '/Home': (context) => HomeScreen(),
      },
    );
  }
}
