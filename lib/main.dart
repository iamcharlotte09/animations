import 'package:animation/animations/screen/animations.screen.dart';
import 'package:animation/quiz_app/screen/splash.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: SafeArea(
            child: SplashScreen(),
          ),
        ));
  }
}
