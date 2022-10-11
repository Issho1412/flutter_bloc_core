import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import '../../config/size_config.dart';

// ------ Color List ------ //
class StyleOthersConst {
  static const kBold = FontWeight.bold;
  static const kRadius = 20.0;
  static const kPaddingDefault = 20.0;
  static const kMarginDefault = 16.0;
  static const kHeightDot = 8.0;
  static const kHeightDefault = 60.0;
  static const kHeadSize = 36.0;
  static const kSize = 14.0;
  
  static const kAnimationDuration = Duration(milliseconds: 200);
  static const defaultDuration = Duration(milliseconds: 250);

  final headingStyle = TextStyle(
    fontSize: getProportionateScreenHeight(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5,
  );

  static final otpInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: ColorConst.kTextColor),
  );
}




