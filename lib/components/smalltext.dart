import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, this.text, this.color});

  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
          // fontSize: getProportionateScreenWidth(14),
          color: color ?? Colors.white,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700),
    );
  }
}
