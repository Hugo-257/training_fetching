// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:training_fetching/logic/utility/app_bloc_observer.dart';
import 'package:training_fetching/screens/splash_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const SplashScreen()),
      blocObserver: AppBlocObserver());
}
