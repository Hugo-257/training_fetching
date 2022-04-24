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

  Joke? _loadedJoke = null;
  Future<void> _fetchData() async {
    Map<String, String> headers = {
      'X-RapidAPI-Host': 'dad-jokes.p.rapidapi.com',
      'X-RapidAPI-Key': 'c41b9dec81mshb58884600d6f633p117f6cjsnd776f8e034b0'
    };
    const url = 'https://dad-jokes.p.rapidapi.com/random/joke';

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      // success
      setState(() {
        _loadedJoke = Joke.fromJson(data);
      });
    }
  }

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
          await _fetchData();
          return HomeScreen(initialJoke: _loadedJoke);
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
