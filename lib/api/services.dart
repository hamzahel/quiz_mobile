import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:quiz/api/Modules/choices.dart';
import 'package:quiz/api/Modules/questions.dart';
import 'package:quiz/api/Modules/technologies.dart';
import 'package:http/http.dart' as http;

class Services with ChangeNotifier {
  int _counterQuestions = 0;
  int _counterCorrect = 0;

  List<Technologies> _technologies = [];
  List<Questions> _questions = [];
  List<Choices> _choices = [];
  List<int> _randIds = [];
  int _rand = 0;
  int _idTech = 0;
  int _idQues = 0;
  int _time = 30;
  int _numberofquestion = 20;
  bool _internetactive = false;

  // int _idTech = -1;

  int get getCounterQuestions => _counterQuestions;
  int get getCounterCorrect => _counterCorrect;
  int get getTime => _time;
  int get getNumberOfQuestion => _numberofquestion;
  List<Technologies> get getTechnologies => _technologies;
  List<Questions> get getQuestions => _questions;
  List<Choices> get getChoices => _choices;
  List<int> get getRandIds => _randIds;
  int get getRand => _rand;
  int get getIdTech => _idTech;
  bool get getInternetActive => _internetactive;
  // int get GetIdTech => _idTech;

  void setNumberOfQuestion(int value) {
    _numberofquestion = value;
    notifyListeners();
  }

  void setTime(int value) {
    if (value > 10) _time = value;
    notifyListeners();
  }

  void initSession() {
    _counterCorrect = 0;
    _counterQuestions = 0;
    _rand = 0;
    _idTech = 0;
    _questions = [];
    _choices = [];
    notifyListeners();
  }

  void initCounters() {
    _counterCorrect = 0;
    _counterQuestions = 0;
    notifyListeners();
  }

  void setCounterQuestion() {
    _counterQuestions++;
    notifyListeners();
  }

  void setCounterCorrect(int id) {
    if (id != -1 && _choices[id].isCorrect) _counterCorrect++;
    notifyListeners();
  }

  void setIdTech(int value) {
    _idTech = value;
    notifyListeners();
  }

  final header = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
  };

  Future initTechnologies() async {
    final url = Uri.parse("https://quiz.myheart.ma/api/technologies");
    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      _technologies =
          body.map((dynamic item) => Technologies.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load Technologies');
    }
  }

  Future initQuestions(int id) async {
    final url = Uri.parse(
        "https://quiz.myheart.ma/api/questions/${_technologies[id].id.toString()}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      _questions =
          body.map((dynamic item) => Questions.fromJson(item)).toList();
      // _counterQuestions = _questions.length;
      // debugPrint("the label is ::::::::::::" + _questions[1].label);
    } else {
      _questions = [];
      // throw Exception('Failed to load Questions');
    }
    notifyListeners();
  }

  Future initChoices(int index) async {
    late Uri url;
    late Response response;
    url = Uri.parse(
        "https://quiz.myheart.ma/api/choices/${_questions[_randIds[index]].id.toString()}");
    response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      _choices = body.map((dynamic item) => Choices.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load Choices');
    }
  }

  bool initRandId() {
    int id = -1;
    _randIds = [];
    try {
      while (true) {
        if (_randIds.length == _questions.length) break;
        id = Random().nextInt(_questions.length);
        if (!_randIds.contains(id)) {
          _randIds.add(id);
        }
      }
    } catch (e) {
      return false;
    }
    notifyListeners();
    return true;
  }

  Future checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _internetactive = true;
      }
    } on SocketException catch (_) {
      _internetactive = false;
    }
    notifyListeners();
  }
}
