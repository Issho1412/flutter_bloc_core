import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/config/colors.dart';
import 'package:src_core_bloc/core/config/constants.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';

class ProfileMenuItem extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function? press;
  final bool isHideArrow;

  const ProfileMenuItem({
    Key? key,
    @required this.text,
    @required this.icon,
    this.press,
    this.isHideArrow = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.kPaddingDefault,
        vertical: AppConstants.kPaddingDefault / 2
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: AppColors.kPrimaryColor,
          padding: const EdgeInsets.all(AppConstants.kPaddingDefault),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.kColorSLight,
        ),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            const SizedBox(
              width: AppConstants.kPaddingDefault,
            ),
            Expanded(
              child: CustomText(
                text: text,
                align: TextAlign.left,
              ),
            ),
            Visibility(
              visible: isHideArrow,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: AppConstants.kSize,
                color: AppColors.kTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
