import 'package:flutter/material.dart';
import 'package:quiz/size_conf.dart';

const nPrimaryColor = Color(0xFFED1C6C);
const nSecondaryColor = Color(0xFFED2240);
const nPrimaryLightColor = Color(0xFFEDEDEE);
const nSecondaryLightColor = Color(0xFFE8E8E8);
const darkColor = Color(0xFF404243);
const nPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFED1C6C), Color(0xFFED2240)],
);
const kAnimationDuration = Duration(milliseconds: 200);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: darkColor,
  fontFamily: "Poppins",
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidator = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneValidator = RegExp(r'^\+\d{10,12}$');

const String emptyField = "Please Enter your ";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: darkColor),
  );
}
