import 'package:flutter/material.dart';
import 'package:quiz/contant.dart';
import 'package:quiz/size_conf.dart';

class PgBar extends StatefulWidget {
  final double? percent;
  final double? width;
  final Color? color;
  final Color? background;
  final Color? borderColor;
  final Function(DragUpdateDetails)? press;

  const PgBar(
      {super.key,
      this.percent,
      this.width,
      this.color,
      this.background,
      this.borderColor,
      this.press});

  @override
  State<PgBar> createState() => _PgBarState();
}

class _PgBarState extends State<PgBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: widget.press,
      child: Container(
          height: getProportionateScreenHeight(30),
          width: widget.width ?? SizeConf.screenWidth,
          // width: getProportionateScreenWidth(50),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: (widget.borderColor ?? nSecondaryLightColor)),
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(8))),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: (widget.width ?? SizeConf.screenWidth) *
                  (widget.percent ?? 0.0),
              decoration: BoxDecoration(
                  color: widget.color ?? nPrimaryColor,
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(8))),
            ),
          )),
    );
  }
}
