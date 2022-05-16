import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:training_fetching/constants.dart';
import 'package:training_fetching/model/joke.dart';
import 'package:training_fetching/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: AnimatedSplashScreen.withScreenFunction(
        screenFunction: () async {
          return HomeScreen(initialJoke: null);
        },
        splash: Text(
          "Groot",
          style: kSplashTitle,
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}
