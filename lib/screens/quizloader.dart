import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/Modules/dataquiz.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/quiz.dart';
import 'package:quiz/screens/quizerror.dart';
import 'package:quiz/size_conf.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../components/simplebutton.dart';

class QuizLoader extends StatefulWidget {
  static String routeName = "/QuizLoader";

  const QuizLoader({super.key});

  @override
  QuizLoaderState createState() => QuizLoaderState();
}

class QuizLoaderState extends State<QuizLoader>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;
  late Services providers;
  int count = 0;
  bool isUp = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
      // navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() async {
    await providers.initQuestions(providers.getIdTech).then((value) {
      providers.initRandId();
      if (providers.getQuestions.isNotEmpty) {
        providers.initChoices(0).then((e) {
          setState(() {
            isUp = true;
          });
        });
      } else {
        isUp = false;
        Navigator.pushReplacementNamed(context, QuizError.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);

    return Consumer<Services>(builder: (context, value, child) {
      providers = value;
      return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            // height: getProportionateScreenHeight(900),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Opacity(
                      opacity: opacity.value,
                      child: Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(250),
                          ),
                          Text(
                            value.getTechnologies[value.getIdTech].label ??
                                "Quiz",
                            style: TextStyle(
                                color: nPrimaryColor,
                                fontSize: getProportionateScreenWidth(24),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(300),
                            child: Text(
                              "Questionnaires are carefully designed questions to help you self-evaluate your understanding of the information presented on the topics covered. No information will be collected on the website regarding your answers or the number of times you complete the survey.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: darkColor,
                                fontFamily: "Poppins",
                                height: getProportionateScreenHeight(1.5),
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: isUp == false
                        ? SizedBox(
                            width: getProportionateScreenWidth(70),
                            height: getProportionateScreenHeight(70),
                            child: const LoadingIndicator(
                              indicatorType: Indicator.ballRotateChase,
                              // backgroundColor: nPrimaryColor,
                              colors: [nPrimaryColor],
                            ),
                          )
                        : SimpleButton(
                            text: "next",
                            width: getProportionateScreenWidth(200),
                            press: () {
                              Navigator.pushReplacementNamed(
                                  context, Quiz.routeName,
                                  arguments: DataQuiz(
                                      question: value
                                          .getQuestions[value.getRandIds[0]]
                                          .label,
                                      listChoices: value.getChoices,
                                      questionCounter: 1,
                                      timer: value.getTime,
                                      totalQuestion:
                                          (value.getNumberOfQuestion >
                                                  value.getQuestions.length
                                              ? value.getQuestions.length
                                              : value.getNumberOfQuestion)));
                            },
                          ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
