import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/components/headtitle.dart';
import 'package:quiz/components/sqicon.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/quizloader.dart';
import 'package:quiz/screens/settings.dart';
import 'package:quiz/size_conf.dart';
import 'package:quiz/wrapper.dart';

class Home extends StatefulWidget {
  static String routeName = "/Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  late Services services;

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    return Consumer<Services>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, Settings.routeName)},
                icon: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  color: darkColor,
                  width: getProportionateScreenWidth(24),
                ))
          ],
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/arrowright.svg",
              color: darkColor,
              width: getProportionateScreenWidth(24),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Wrapper.routeName);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(15)),
          width: SizeConf.screenWidth,
          color: Colors.white,
          child: ListView(
            children: [
              const HeadTitle(text: "Technologies", color: darkColor),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              SizedBox(
                // color: Colors.red,
                height: SizeConf.screenHeight * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(80),
                          ),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                (value.getTechnologies.length / 2).round(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  value.setIdTech(index);
                                  // await value.initQuestions(index).then((e) {
                                  Navigator.pushNamed(
                                    context,
                                    QuizLoader.routeName,
                                  );
                                  // });
                                },
                                child: Column(
                                  children: [
                                    // Text(techs[index]["text"]),
                                    SqIcon(
                                      icon: value.getTechnologies[index].src,
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(20),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                (value.getTechnologies.length / 2).round(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                // on tap handler
                                onTap: () async {
                                  // value.setIdTech(index +
                                  //     (value.getTechnologies.length / 2)
                                  //         .round());
                                  // await value
                                  //     .initQuestions(index +
                                  //         (value.getTechnologies.length / 2)
                                  //             .round())
                                  //     .then((e) {
                                  value.setIdTech(index +
                                      (value.getTechnologies.length / 2)
                                          .round());
                                  Navigator.pushNamed(
                                    context,
                                    QuizLoader.routeName,
                                  );
                                  // });
                                },
                                child: Column(
                                  children: [
                                    // Text(techs[index]["text"]),
                                    SqIcon(
                                      icon: value
                                          .getTechnologies[index +
                                              (value.getTechnologies.length / 2)
                                                  .round()]
                                          .src,
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(20),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
