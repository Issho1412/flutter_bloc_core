import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src_core_bloc/core/config/colors.dart';
import '../../core/config/size_config.dart';
import '../../core/config/constants.dart';

class SocialCardItem extends StatelessWidget {
  final String? icon;
  final Function()? onTap;

  const SocialCardItem({
    Key? key,
    this.icon,
    this.onTap
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? (){},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(AppConstants.kPaddingDefault/2)),
        padding: EdgeInsets.all(getProportionateScreenWidth(AppConstants.kMarginDefault - 2)),
        height: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(60),
        decoration: const BoxDecoration(
          color: AppColors.kColorSLight,
          shape: BoxShape.circle,
        ),
        child: icon != null 
          ? SvgPicture.asset(icon!)
          : const SizedBox(),
      ),
    );
  }
}
