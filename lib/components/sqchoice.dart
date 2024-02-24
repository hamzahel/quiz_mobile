import 'package:flutter/material.dart';
import 'package:quiz/components/toggel.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/size_conf.dart';

class SqChoice extends StatefulWidget {
  const SqChoice({super.key, this.color, this.text, required this.number});

  final String? text;
  final Color? color;
  final String number;

  @override
  State<SqChoice> createState() => _SqChoiceState();
}

class _SqChoiceState extends State<SqChoice> {
  TextStyle textstyle = TextStyle(
      color: darkColor,
      fontSize: getProportionateScreenWidth(12),
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      height: getProportionateScreenHeight(55),
      width: getProportionateScreenWidth(325),
      decoration: BoxDecoration(
          border: Border.all(color: widget.color ?? nSecondaryLightColor),
          borderRadius: BorderRadius.all(
              Radius.circular(getProportionateScreenWidth(5)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                widget.number,
                style: textstyle,
              ),
              Text(
                widget.text ?? "",
                style: textstyle,
              ),
            ],
          ),
          Toggel(
            color: widget.color,
          ),
        ],
      ),
    );
  }
}
