import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/Modules/dataquiz.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/components/simplebutton.dart';
import 'package:quiz/components/simpletext.dart';
import 'package:quiz/components/smalltext.dart';
import 'package:quiz/components/sqchoice.dart';
import 'package:quiz/components/timerswitch.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/result.dart';
import 'package:quiz/size_conf.dart';
import 'package:quiz/wrapper.dart';

class Quiz extends StatefulWidget {
  static String routeName = "/Quiz";
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int i = -1;
  late Services providers;

  @override
  Widget build(BuildContext context) {
    final DataQuiz args =
        ModalRoute.of(context)!.settings.arguments as DataQuiz;

    return Consumer<Services>(builder: (context, value, child) {
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
            onPressed: () {
              Navigator.pushReplacementNamed(context, Wrapper.routeName);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: darkColor,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15),
                  vertical: getProportionateScreenWidth(100)),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5)),
                color: Colors.white,
                child: ListView(
                  children: [
                    SimpleText(
                        // text: value.GetQuestions[value.getRand - 1].label,
                        text: args.question),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                i = index;
                              });
                            },
                            child: Column(
                              children: [
                                SqChoice(
                                  text: (args.listChoices[index].label.length >
                                          40)
                                      ? args.listChoices[index].label
                                          .substring(0, 35)
                                      : args.listChoices[index].label,
                                  number: " ${index + 1} - ",
                                  color: i == index
                                      ? nPrimaryColor
                                      : nSecondaryLightColor,
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(15),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(60),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: TimerSwitch(
                  context: context,
                  count: value.getTime,
                  index: i,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(75),
                  left: getProportionateScreenWidth(15)),
              child: Align(
                alignment: Alignment.topLeft,
                child: SmallText(
                  text: "${args.questionCounter} / ${args.totalQuestion}",
                  // "${value.getCounterQuestions} / ${value.getCounterQuestions}",
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(80)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SimpleButton(
                    text: "next",
                    press: () {
                      value.setCounterCorrect(i);
                      value.setCounterQuestion();
                      value.initChoices(value.getCounterQuestions).then((e) {
                        if (value.getCounterQuestions == args.totalQuestion) {
                          Navigator.pushReplacementNamed(
                              context, Result.routeName);
                        } else {
                          Navigator.pushReplacementNamed(
                              context, Quiz.routeName,
                              arguments: DataQuiz(
                                  question: value
                                      .getQuestions[value.getRandIds[
                                          value.getCounterQuestions]]
                                      .label,
                                  listChoices: value.getChoices,
                                  questionCounter:
                                      value.getCounterQuestions + 1,
                                  timer: value.getTime,
                                  totalQuestion: (value.getNumberOfQuestion >
                                          value.getQuestions.length
                                      ? value.getQuestions.length
                                      : value.getNumberOfQuestion)));
                        }
                      });
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }
}

// class DataQuiz {
//   final int questionCounter;
//   final int totalQuestion;
//   final List<Choices> listChoices;
//   final String question;

//   DataQuiz({
//     required this.question,
//     required this.listChoices,
//     required this.questionCounter,
//     required this.totalQuestion,
//   });
// }
