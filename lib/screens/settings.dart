import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/components/headtitle.dart';
import 'package:quiz/components/pgbar.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/size_conf.dart';

class Settings extends StatefulWidget {
  static String routeName = "/Settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late Services services;

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    return Consumer<Services>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/arrowright.svg",
              color: darkColor,
              width: getProportionateScreenWidth(24),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Home.routeName);
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
              const HeadTitle(text: "Settings", color: darkColor),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5)),
                child: const Divider(
                  color: nSecondaryLightColor,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("delay"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15)),
                      child: PgBar(
                        width: getProportionateScreenWidth(200),
                        percent: value.getTime / 90,
                        press: (e) {
                          if (e.localPosition.dx !=
                                  getProportionateScreenWidth(200) &&
                              e.localPosition.dx > 15) {
                            setState(() {
                              value.setTime((90 *
                                      (e.localPosition.dx /
                                          getProportionateScreenWidth(200)))
                                  .round());
                            });
                          }
                        },
                      ),
                    ),
                    Text("${value.getTime.round()}s")
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("number"),
                  DropdownButton<int>(
                    hint: Text(value.getNumberOfQuestion.toString()),
                    items: <int>[15, 20, 25, 30].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenHeight(10)),
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                  color: darkColor,
                                  fontSize: getProportionateScreenWidth(14)),
                            )),
                      );
                    }).toList(),
                    onChanged: (e) {
                      value.setNumberOfQuestion(e ?? 20);
                    },
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("language"),
                  DropdownButton<String>(
                    hint: const Text("English"),
                    items: <String>["English"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenHeight(10)),
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                  color: darkColor,
                                  fontSize: getProportionateScreenWidth(14)),
                            )),
                      );
                    }).toList(),
                    onChanged: (e) {
                      // value.setNumberOfQuestion(e ?? 20);
                    },
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
            ],
          ),
        ),
      );
    });
  }
}
