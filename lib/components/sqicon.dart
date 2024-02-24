import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/size_conf.dart';

class SqIcon extends StatelessWidget {
  const SqIcon({this.icon, super.key});

  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: getProportionateScreenWidth(162),
        height: getProportionateScreenHeight(162),
        decoration: BoxDecoration(
          border: Border.all(color: nSecondaryLightColor),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(24),
            ),
            SvgPicture.network(
              icon ?? "assets/icons/react.js",
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenHeight(100),
            ),
            SizedBox(
              height: getProportionateScreenHeight(14),
            ),
          ],
        ),
      ),
    );
  }
}
