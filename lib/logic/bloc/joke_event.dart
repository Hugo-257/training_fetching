part of 'joke_bloc.dart';

@immutable
abstract class JokeBlocEvent extends Equatable {
  const JokeBlocEvent();
  @override
  List<Object> get props => [];
}

class GetJoke extends JokeBlocEvent {}
