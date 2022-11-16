import 'package:flutter/material.dart';

// ------ Color List ------ //
class ColorConst {
  ColorConst._();
  static const kPrimaryColor = Color(0xFFFF7643); // Main color
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF757575);
  static const kTextHeadline6 = Color(0xFF8B8B8B);
  static const kColorSLight = Color(0xFFF5F6F9);
  static const kColorCategoryCard = Color(0xFF343434);
  static const kColorDotOpacity = Color(0xFFD8D8D8);

  static const kTxtInfo = Color(0xFF3795F1);
  static const kTxtDanger = Colors.red;
  static const kTxtSuccess = Color(0xFF6ED097);

  static const kDarkBlue = Color(0xFF01249D);

  static const kTransparent = Colors.transparent;
  static const kTxtWhite = Colors.white;
  static const kTxtDefault = Colors.black;
}
