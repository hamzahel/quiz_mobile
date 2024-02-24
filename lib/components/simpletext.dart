import 'package:flutter/material.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/size_conf.dart';

class SimpleText extends StatelessWidget {
  const SimpleText({super.key, required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(15),
          top: getProportionateScreenHeight(75)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            color: color ?? darkColor,
            fontFamily: "Poppins",
            // height: getProportionateScreenHeight(2),
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
