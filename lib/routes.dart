import 'package:flutter/material.dart';
import 'package:quiz/screens/errorconnection.dart';
import 'package:quiz/screens/intro.dart';
import 'package:quiz/screens/quiz.dart';
import 'package:quiz/screens/settings.dart';
import 'package:quiz/screens/quizerror.dart';
import 'package:quiz/screens/quizloader.dart';
import 'package:quiz/screens/result.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/wrapper.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => const Home(),
  Quiz.routeName: (context) => const Quiz(),
  Result.routeName: (context) => const Result(),
  Wrapper.routeName: (context) => const Wrapper(),
  QuizLoader.routeName: (context) => const QuizLoader(),
  QuizError.routeName: (context) => const QuizError(),
  Settings.routeName: (context) => const Settings(),
  Intro.routeName: (context) => Intro(),
  ErrorConnection.routeName: (context) => const ErrorConnection(),
};
