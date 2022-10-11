import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import '../../core/config/size_config.dart';
import '../../core/util/style/others.dart';

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
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(StyleOthersConst.kPaddingDefault/2)),
        padding: EdgeInsets.all(getProportionateScreenWidth(StyleOthersConst.kMarginDefault - 2)),
        height: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(60),
        decoration: const BoxDecoration(
          color: ColorConst.kColorSLight,
          shape: BoxShape.circle,
        ),
        child: icon != null 
          ? SvgPicture.asset(icon!)
          : const SizedBox(),
      ),
    );
  }
}
