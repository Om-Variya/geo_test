import 'package:flutter/material.dart';
import 'package:geo_test/Screen/AuthScreen/login.dart';
import 'package:geo_test/Screen/UserScreen/splash_screen.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}
