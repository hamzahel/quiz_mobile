import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/Modules/dataquiz.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/components/simplebutton.dart';
import 'package:quiz/components/simpletext.dart';
import 'package:quiz/components/smalltext.dart';
import 'package:quiz/components/sqchoice.dart';

import 'package:quiz/contant.dart';
import 'package:quiz/screens/result.dart';
import 'package:quiz/size_conf.dart';

class QuizContainer extends StatefulWidget {
  final DataQuiz args;
  final void Function()? press;

  const QuizContainer({super.key, required this.args, this.press});

  @override
  State<QuizContainer> createState() => _QuizContainerState();
}

class _QuizContainerState extends State<QuizContainer> {
  int i = -1;
  // PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: widget.press,
    //   child: Container(
    //     child: Text("page ${widget.args.questionCounter}"),
    //   ),
    // );
    return Consumer<Services>(builder: (context, value, child) {
      return Stack(
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
                      text: widget.args.question),
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
                                text:
                                    (value.getChoices[index].label.length > 40)
                                        ? value.getChoices[index].label
                                            .substring(0, 35)
                                        : value.getChoices[index].label,
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
          // Padding(
          //   padding: EdgeInsets.only(
          //     top: getProportionateScreenHeight(60),
          //   ),
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //     child: TimerSwitch(
          //       controller: controller,
          //       count: widget.args.timer,
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(75),
                left: getProportionateScreenWidth(15)),
            child: Align(
              alignment: Alignment.topLeft,
              child: SmallText(
                text:
                    "${widget.args.questionCounter} / ${widget.args.totalQuestion}",
                // "${value.getCounterQuestions} / ${value.getCounterQuestions}",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenHeight(80)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SimpleButton(
                text: "next",
                press: widget.press,
                //  () {
                // if (value.getCounterQuestions ==
                //     widget.args.totalQuestion) {
                //   Navigator.pushReplacementNamed(
                //       context, Result.routeName);
                // }

                // else {
                //   setState(() {
                //     args = DataQuiz(
                //         question:
                //             value.getQuestions[value.getRand - 1].label,
                //         listChoices: value.getChoices,
                //         questionCounter: value.getCounterQuestions,
                //         totalQuestion: (value.getNumberOfQuestion >
                //                 value.getQuestions.length
                //             ? value.getQuestions.length
                //             : value.getNumberOfQuestion));
                //     widget.controller.nextPage(
                //         duration: const Duration(microseconds: 100),
                //         curve: Curves.easeIn);
                //   });
                // }
                // });
                // }
              ),
            ),
          ),
        ],
      );
    });
  }
}
