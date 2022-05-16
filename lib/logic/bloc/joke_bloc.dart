import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:training_fetching/logic/models/joke_model.dart';
import 'package:training_fetching/logic/resources/api_repository.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetJoke>((event, emit) async {
      try {
        emit(JokeLoading());
        final joke = await _apiRepository.fetchJoke();
        if (joke.error == null) {
          print(joke.body);
          emit(JokeLoaded(joke));
        } else {
          print(joke.error);
          emit(JokeError(joke.error));
        }
      } catch (e) {
        emit(JokeError(e.toString()));
      }
    });
  }
}
