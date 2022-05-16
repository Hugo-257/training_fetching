// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_fetching/components/header.dart';
import 'package:training_fetching/components/joke_section.dart';
import 'package:training_fetching/components/loading_spinner.dart';
import 'package:training_fetching/components/refresh_button.dart';
import 'package:training_fetching/constants.dart';
import 'package:training_fetching/logic/bloc/joke_bloc.dart';
import 'package:training_fetching/logic/models/joke_model.dart';

class HomeScreen extends StatefulWidget {
  Joke? initialJoke;
  HomeScreen({this.initialJoke, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JokeBloc>(
          create: (_) => JokeBloc()..add(GetJoke()),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          toolbarHeight: 0, // status bar color
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Header(),
            Builder(builder: (context) {
              return BlocConsumer<JokeBloc, JokeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var message = "";
                  if (state is JokeLoading) {
                    message = "Loading...";
                  } else if (state is JokeError) {
                    message = state.error as String;
                  }

                  return Container(
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
                            child: context.watch<JokeBloc>().state is JokeLoaded
                                ? JokeSection(
                                    loadedJoke: (context.watch<JokeBloc>().state
                                            as JokeLoaded)
                                        .joke,
                                  )
                                : Text(
                                    message,
                                    style: kNotification,
                                    textAlign: TextAlign.center,
                                  ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 60.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              context.read<JokeBloc>().add(GetJoke());
                            },
                            child: BlocProvider.of<JokeBloc>(context).state
                                    is JokeLoading
                                ? LoadingSpinner()
                                : RefreshButton(),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }),
          ]),
          decoration: BoxDecoration(
            color: kBodyColor,
          ),
        ),
      ),
    );
  }
}
