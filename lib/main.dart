// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:training_fetching/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: Text(
          "Groot",
          style: kSplashTitle,
        ),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 0, // status bar color
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text("Root", style: kHeaderTitle),
                  Text(
                    "Your daily dose of humour",
                    style: kHeaderSubtitle,
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 40.0,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "How many programmers does it take to change a light bulb? -None.That's a hardware problem",
                          style: kJoke,
                          textAlign: TextAlign.center,
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("Programming", style: kBtnText),
                            decoration: BoxDecoration(
                              color: kBtnBackground,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 5.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: kBackgroundColor,
                    child: Icon(
                      Icons.refresh,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    radius: 35,
                  ),
                )
              ],
            ),
          )
        ]),
        decoration: BoxDecoration(
          color: kBodyColor,
        ),
      ),
    );
  }
}
//#ea6f79
