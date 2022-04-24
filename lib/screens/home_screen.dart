// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:training_fetching/components/header.dart';
import 'package:training_fetching/components/joke_section.dart';
import 'package:training_fetching/components/refresh_button.dart';
import 'package:training_fetching/constants.dart';
import 'package:http/http.dart' as http;
import 'package:training_fetching/model/joke.dart';

class HomeScreen extends StatefulWidget {
  Joke? initialJoke;
  HomeScreen({this.initialJoke, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  Joke? _loadedJoke;
  bool loading = false;
  bool initialRender = true;
  String message = "Loading...";

  Future<void> _fetchData() async {
    _controller.forward();
    message = "Loading...";
    setState(() {
      initialRender = true;
      loading = true;
    });

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
        loading = false;
      });
    } else {
      message = "Couldn't fetch the joke!";
    }
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    if (widget.initialJoke == null) {
      _fetchData();
    }
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
          Header(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    bottom: 50.0,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    alignment: Alignment.center,
                    child: (loading)
                        ? Center(
                            child: Text(
                              message,
                              style: kNotification,
                            ),
                          )
                        : JokeSection(
                            loadedJoke: initialRender
                                ? widget.initialJoke
                                : _loadedJoke),
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
                    child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                        child: RefreshButton()),
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
