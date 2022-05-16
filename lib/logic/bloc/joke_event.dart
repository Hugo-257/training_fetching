part of 'joke_bloc.dart';

@immutable
abstract class JokeEvent extends Equatable {
  const JokeEvent();
  @override
  List<Object> get props => [];
}

class GetJoke extends JokeEvent {}
