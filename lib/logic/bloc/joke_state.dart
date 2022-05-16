part of 'joke_bloc.dart';

@immutable
abstract class JokeState extends Equatable {
  @override
  List<Object> get props => [];
}

class JokeInitial extends JokeState {}

class JokeLoading extends JokeState {}

class JokeLoaded extends JokeState {
  final Joke? joke;
  JokeLoaded(this.joke);
}

class JokeError extends JokeState {
  final String? error;
  JokeError(this.error);
}
