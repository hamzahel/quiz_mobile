import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/components/simplebutton.dart';
import 'package:quiz/components/simpletext.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/size_conf.dart';
import 'package:quiz/wrapper.dart';

class QuizError extends StatelessWidget {
  static String routeName = "/QuizError";
  const QuizError({super.key});

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
      body: Container(
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
                        borderRadius: BorderRadius.all(
                            Radius.circular(getProportionateScreenWidth(100)))),
                    child: SvgPicture.asset(
                      "assets/icons/Error.svg",
                      color: nPrimaryColor,
                      width: getProportionateScreenWidth(100),
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
                child: const SimpleText(
                  text: "There is no Quiz for this Technology !",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(220),
              ),
              SimpleButton(
                text: "go home",
                press: () {
                  Navigator.pushReplacementNamed(context, Home.routeName);
                },
              ),
            ],
          )),
    );
  }
}
