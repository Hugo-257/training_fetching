// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:training_fetching/constants.dart';
import 'package:training_fetching/logic/models/joke_model.dart';

class JokeSection extends StatelessWidget {
  const JokeSection({
    Key? key,
    required Joke? loadedJoke,
  })  : _loadedJoke = loadedJoke,
        super(key: key);

  final Joke? _loadedJoke;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${(_loadedJoke?.body as List)[0].setup} -${(_loadedJoke?.body as List)[0].punchline}',
            style: kJoke,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                  '${(_loadedJoke?.body as List)[0].type}'[0].toUpperCase() +
                      '${(_loadedJoke?.body as List)[0].type}'.substring(1),
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
    );
  }
}
