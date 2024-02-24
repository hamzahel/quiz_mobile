import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/components/simplebutton.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/size_conf.dart';
import 'package:quiz/wrapper.dart';
import 'package:quiz/size_conf.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  static String routeName = "/Intro";
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  Intro({super.key});
  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<Intro> {
  int currentPage = 0;
  // List<Map<String, String>> splashData = [
  //   {"text": "intro1", "sub": "", "image": "assets/images/intro1.png"},
  //   {"text": "intro2", "sub": "", "image": "assets/images/intro1.png"},
  //   {"text": "intro3", "sub": "", "image": "assets/images/intro1.png"},
  //   {"text": "", "sub": "", "image": "assets/images/intro1.png"},
  // ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController cont = PageController(initialPage: 0);

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/coverintro.svg",
            width: SizeConf.screenWidth,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(120),
            ),
            child: Column(
              children: [
                Container(
                  width: SizeConf.screenWidth,
                  child: Text(
                      "Practice like you've never won Perform like you've never lost.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: getProportionateScreenHeight(2),
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                Container(
                  height: getProportionateScreenHeight(450),
                  width: getProportionateScreenWidth(330),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/intro1.png",
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(650)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SimpleButton(
                      text: "next",
                      press: () async {
                        await widget.prefs.then((value) {
                          value.setBool("intro", true);
                          Navigator.pushReplacementNamed(
                              context, Wrapper.routeName);
                        });
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
