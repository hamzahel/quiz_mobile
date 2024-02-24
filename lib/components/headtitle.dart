// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:quiz/size_conf.dart';

class HeadTitle extends StatelessWidget {
  final String text;
  final Color color;

  const HeadTitle({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: getProportionateScreenWidth(28)));
  }
}
