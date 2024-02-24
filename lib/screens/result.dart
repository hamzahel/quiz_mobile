import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/Modules/dataquiz.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/components/simplebutton.dart';
import 'package:quiz/components/simpletext.dart';
import 'package:quiz/components/smalltext.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/quiz.dart';
import 'package:quiz/size_conf.dart';
import 'package:quiz/wrapper.dart';

class Result extends StatefulWidget {
  static String routeName = "/Result";
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrowright.svg",
            color: Colors.white,
            width: getProportionateScreenWidth(24),
          ),
          onPressed: () =>
              {Navigator.pushReplacementNamed(context, Wrapper.routeName)},
        ),
      ),
      body: Consumer<Services>(builder: (context, value, child) {
        return Container(
            color: darkColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(80),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      // width: getProportionateScreenWidth(140),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              getProportionateScreenWidth(100)))),
                      child: CircularPercentIndicator(
                        startAngle: 0,
                        radius: 75.0,
                        lineWidth: 16.0,
                        percent: (value.getCounterCorrect /
                            value.getCounterQuestions),
                        // fillColor: Colors.white,
                        backgroundColor: nSecondaryLightColor,
                        center: SmallText(
                          text:
                              "${value.getCounterCorrect.toString()} / ${value.getCounterQuestions.toString()}",
                          // style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w700)
                        ),
                        progressColor: nPrimaryColor,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(50)),
                  child: SimpleText(
                    text: (value.getCounterCorrect >=
                            (value.getCounterQuestions / 2))
                        ? "Congratulations, you passed the test."
                        : "You're failing this test !",
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(220),
                ),
                SimpleButton(
                  text: "retry",
                  press: () {
                    value.initCounters();
                    value.initRandId();
                    // value.setCounterQuestion();

                    value.initChoices(0).then((e) {
                      Navigator.pushReplacementNamed(context, Quiz.routeName,
                          arguments: DataQuiz(
                              question:
                                  value.getQuestions[value.getRandIds[0]].label,
                              questionCounter: 1,
                              timer: value.getTime,
                              listChoices: value.getChoices,
                              totalQuestion: (value.getNumberOfQuestion >
                                      value.getQuestions.length
                                  ? value.getQuestions.length
                                  : value.getNumberOfQuestion)));
                    });
                  },
                ),
              ],
            ));
      }),
    );
  }
}
