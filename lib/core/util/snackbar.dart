import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import 'package:src_core_bloc/core/util/enum.dart';
import 'package:src_core_bloc/core/util/globals.dart';
import 'package:src_core_bloc/core/util/style/others.dart';

void showSnackBar(String msg, [type = SnackType.success]) {
  Color? textColor = ColorConst.kTextColor;
  switch (type) {
    case SnackType.fail:
      textColor = ColorConst.kTxtDanger;
      break;
    case SnackType.success:
      textColor = ColorConst.kTxtSuccess;
      break;
    default:
      textColor = ColorConst.kTxtDefault;
  }
  final SnackBar snackBar = SnackBar(
    backgroundColor: ColorConst.kTransparent,
    elevation: 0,
    content: Container(
      padding: const EdgeInsets.all(StyleOthersConst.kPaddingDefault),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: textColor
      ),
      child: Row(
        children: [
          Text(
            msg,
            style: const TextStyle(
              color: ColorConst.kTxtWhite ,
              fontSize: 15, fontWeight: FontWeight.w400),
          ),
          // const Icon(Icons.done_outline)
        ],
      ),
    )
  );
  GlobalsKey.snackbarKey.currentState?.clearSnackBars();
  GlobalsKey.snackbarKey.currentState?.showSnackBar(snackBar);
}
