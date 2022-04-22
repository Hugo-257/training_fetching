// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()
import 'package:page_transition/page_transition.dart';
import 'package:training_fetching/constants.dart';
import 'package:training_fetching/model/joke.dart';

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
      print((_loadedJoke?.body as List)[0].punchline);
    } else {
      print("Error");
    }
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

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
                    child: _loadedJoke != null
                        ? SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${(_loadedJoke?.body as List)[0].setup} -${(_loadedJoke?.body as List)[0].punchline}',
                                  style: kJoke,
                                  textAlign: TextAlign.center,
                                ),
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                        '${(_loadedJoke?.body as List)[0].type}'[
                                                    0]
                                                .toUpperCase() +
                                            '${(_loadedJoke?.body as List)[0].type}'
                                                .substring(1),
                                        style: kBtnText),
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
                          )
                        : Center(
                            child: Text(
                              "No Joke Available!",
                              style: kNotification,
                            ),
                          ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => {
                      _fetchData(),
                    },
                    child: CircleAvatar(
                      backgroundColor: kBackgroundColor,
                      child: Icon(
                        Icons.sync,
                        size: 45.0,
                        color: Colors.white,
                      ),
                      radius: 35,
                    ),
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
