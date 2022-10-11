import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import 'package:src_core_bloc/core/util/enum.dart';
import 'package:src_core_bloc/core/util/globals.dart';

void showSnackBar(String msg, [type = SnackType.success]) {
  Color? textColor = ColorConst.kTextColor;
  switch (type) {
    case SnackType.fail:
      textColor = ColorConst.kTxtDanger;
      break;
    case SnackType.success:
      textColor = ColorConst.kTxtInfo;
      break;
    default:
      textColor = ColorConst.kTxtDefault;
  }
  final SnackBar snackBar = SnackBar(
      content: Text(
    msg,
    style: TextStyle(
      color: textColor ,
      fontSize: 15, fontWeight: FontWeight.w400),
  ));
  GlobalsKey.snackbarKey.currentState?.clearSnackBars();
  GlobalsKey.snackbarKey.currentState?.showSnackBar(snackBar);
}
