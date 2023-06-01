import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'modelo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5,
      backgroundColor: Colors.black,
      splash: 'assets/face-recognition.gif',
      nextScreen: const ModeloPage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}