import 'package:flutter/material.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/size_conf.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.text, this.width, this.press});
  final String text;
  final double? width;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: press,
        child: Container(
          width: getProportionateScreenWidth(width ?? 180),
          height: getProportionateScreenHeight(50),
          decoration: BoxDecoration(
            color: nPrimaryColor,
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(5))),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
