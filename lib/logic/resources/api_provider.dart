// ignore_for_file: unused_element

import 'dart:async';
import 'dart:convert';
import 'package:training_fetching/logic/models/joke_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final url = 'https://dad-jokes.p.rapidapi.com/random/joke';
  Future<Joke> fetchData() async {
    Map<String, String> headers = {
      'X-RapidAPI-Host': 'dad-jokes.p.rapidapi.com',
      'X-RapidAPI-Key': 'c41b9dec81mshb58884600d6f633p117f6cjsnd776f8e034b0'
    };
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));

      final data = json.decode(response.body);

      switch (response.statusCode) {
        case 200:
          return Joke.fromJson(data);
        case 429:
          return Joke.withError("Maximum of jokes's day riched");
        default:
          return Joke.withError("Couldn't fetch the joke!");
      }
    } on TimeoutException catch (e) {
      return Joke.withError("Check your connection!");
    } on Error catch (e) {
      return Joke.withError("Couldn't fetch the joke!");
    }
  }
}
