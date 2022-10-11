import 'package:src_core_bloc/core/const.dart';
import 'package:flutter/material.dart';
import '../../util/style/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorConst.kTxtWhite,
    fontFamily: sFontDefault,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}

TextTheme textTheme() => const TextTheme(
  bodyText1: TextStyle(color: ColorConst.kTextColor),
  bodyText2: TextStyle(color: ColorConst.kTextColor)
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: ColorConst.kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

AppBarTheme appBarTheme() => const AppBarTheme(
  color: ColorConst.kTxtWhite,
  elevation: 0,
  iconTheme: IconThemeData(color: ColorConst.kTxtWhite),
  titleTextStyle: TextStyle(color: ColorConst.kTextHeadline6), 
  toolbarTextStyle: TextStyle(color: ColorConst.kTextHeadline6), 
);