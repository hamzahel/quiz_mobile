import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quiz/api/services.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/screens/errorconnection.dart';
import 'package:quiz/screens/intro.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/size_conf.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  static String routeName = "/Wrapper";

  const Wrapper({super.key});
  @override
  WrapperState createState() => WrapperState();
}

class WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;
  late Services providers;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  int count = 0;

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
    });
  }

  // @override
  // didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // controller.dispose();
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() async {
    await providers.checkConnection().then((e) {
      if (!providers.getInternetActive) {
        Navigator.pushReplacementNamed(context, ErrorConnection.routeName);
      } else {
        providers.initSession();
        prefs.then((value) {
          if (value.getBool("intro") == null) {
            Navigator.pushReplacementNamed(context, Intro.routeName);
          } else {
            providers.initTechnologies().then((e) {
              Navigator.pushReplacementNamed(context, Home.routeName);
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    return Consumer<Services>(builder: (context, value, child) {
      providers = value;
      return Scaffold(
        body: Container(
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
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: getProportionateScreenWidth(85),
                    )),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: SizedBox(
                    width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(70),
                    child: const LoadingIndicator(
                      indicatorType: Indicator.ballRotateChase,
                      // backgroundColor: nPrimaryColor,
                      colors: [nPrimaryColor],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              )
            ],
          ),
        ),
      );
    });
  }
}
