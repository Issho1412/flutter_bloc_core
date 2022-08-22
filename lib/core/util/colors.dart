import 'package:flutter/material.dart';
import '../config/size_config.dart';

// ------ Color List ------ //
const kPrimaryColor = Color(0xFFFF7643); // Main color
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kTextHeadline6 = Color(0xFF8B8B8B);
const kColorSLight = Color(0xFFF5F6F9);
const kColorCategoryCard = Color(0xFF343434);

const kTxtInfo = Color(0xFF3795F1);

const kAnimationDuration = Duration(milliseconds: 200);

const kTransparent = Colors.transparent;
const kTxtWhite = Colors.white;
const kTxtDefault = Colors.black;
const kBold = FontWeight.bold;
const kRadius = 20.0;
const kPaddingDefault = 20.0;
const kMarginDefault = 16.0;
const kHeightDot = 8.0;
const kHeightDefault = 60.0;
const kHeadSize = 36.0;
const kSize = 14.0;

final headingStyle = TextStyle(
  fontSize: getProportionateScreenHeight(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

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
    borderSide: const BorderSide(color: kTextColor),
  );
}
