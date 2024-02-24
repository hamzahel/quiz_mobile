import 'package:flutter/material.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/size_conf.dart';

class Toggel extends StatefulWidget {
  const Toggel({super.key, this.color});
  final Color? color;

  @override
  State<Toggel> createState() => _ToggelState();
}

class _ToggelState extends State<Toggel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(26),
        width: getProportionateScreenWidth(26),
        decoration: BoxDecoration(
          color: widget.color ?? nSecondaryLightColor,
          borderRadius: BorderRadius.all(
              Radius.circular(getProportionateScreenWidth(50))),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: getProportionateScreenHeight(15),
            width: getProportionateScreenWidth(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(20))),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0, // soften the shadow
                  spreadRadius: 0.5, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
