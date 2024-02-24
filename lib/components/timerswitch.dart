import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/Modules/dataquiz.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/quiz.dart';
import 'package:quiz/screens/Result.dart';
import 'package:quiz/size_conf.dart';

class TimerSwitch extends StatefulWidget {
  final Function()? action;
  final int? count;
  final int? index;
  final BuildContext context;

  const TimerSwitch(
      {super.key, this.action, this.count, required this.context, this.index});

  @override
  State<TimerSwitch> createState() => _TimerSwitchState();
}

class _TimerSwitchState extends State<TimerSwitch> {
  /// declare a cound variable with initial value
  int count = 20;

  /// declare a timer
  Timer? timer;
  late Services provider;

  @override
  void initState() {
    super.initState();
    count = widget.count ?? 20;

    /// Initialize a periodic timer with 1 second duration
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        setState(() {
          if (count > 0) count--;
          if (count == 0) {
            timer.cancel();
            // if (widget.index >= 0)
            provider.setCounterCorrect(widget.index ?? -1);
            provider.setCounterQuestion();
            provider
                .initChoices(provider.getRandIds[provider.getCounterQuestions])
                .then((e) {
              if (provider.getCounterQuestions ==
                  provider.getQuestions.length) {
                Navigator.pushReplacementNamed(context, Result.routeName);
              } else {
                Navigator.pushReplacementNamed(context, Quiz.routeName,
                    arguments: DataQuiz(
                        question: provider
                            .getQuestions[provider
                                .getRandIds[provider.getCounterQuestions]]
                            .label,
                        listChoices: provider.getChoices,
                        questionCounter: provider.getCounterQuestions + 1,
                        timer: provider.getTime,
                        totalQuestion: (provider.getNumberOfQuestion >
                                provider.getQuestions.length
                            ? provider.getQuestions.length
                            : provider.getNumberOfQuestion)));
              }
            });
          }
        });
      },
    );
  }

  /// Since periodic timer doesn't cancels untill expicitely called
  /// It is important to cancel them on dispose, so that it doesn't stays active
  /// when widget is not binded to tree
  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void handleTimeout() {}
  @override
  Widget build(BuildContext context) {
    return Consumer<Services>(builder: (context, value, child) {
      provider = value;
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(100)))),
        child: CircularPercentIndicator(
          startAngle: 0,
          radius: 45.0,
          lineWidth: 10.0,
          percent: ((count > 0 ? count : 0) / (widget.count ?? 20)),
          fillColor: Colors.white,
          backgroundColor: Colors.white,
          center: Text("${(count)}s",
              style: const TextStyle(
                  color: darkColor, fontWeight: FontWeight.w700)),
          progressColor: nPrimaryColor,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      );
    });
  }
}
