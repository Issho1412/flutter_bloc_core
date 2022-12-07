import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/config/colors.dart';
import 'package:src_core_bloc/core/routes/navigate_service.dart';
import 'package:src_core_bloc/core/util/enum.dart';
import 'package:src_core_bloc/core/config/constants.dart';

void showSnackBar(String msg, [type = SnackType.success]) {
  Color? textColor = AppColors.kTextColor;
  switch (type) {
    case SnackType.fail:
      textColor = AppColors.kTxtDanger;
      break;
    case SnackType.success:
      textColor = AppColors.kTxtSuccess;
      break;
    default:
      textColor = AppColors.kTxtDefault;
  }
  final SnackBar snackBar = SnackBar(
    backgroundColor: AppColors.kTransparent,
    elevation: 0,
    content: Container(
      padding: const EdgeInsets.all(AppConstants.kPaddingDefault),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: textColor
      ),
      child: Row(
        children: [
          Text(
            msg,
            style: const TextStyle(
              color: AppColors.kTxtWhite ,
              fontSize: 15, fontWeight: FontWeight.w400),
          ),
          // const Icon(Icons.done_outline)
        ],
      ),
    )
  );
  NavigationService.snackbarKey.currentState?.clearSnackBars();
  NavigationService.snackbarKey.currentState?.showSnackBar(snackBar);
}
