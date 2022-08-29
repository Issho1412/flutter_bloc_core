import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/config/size_config.dart';
import '../../core/util/colors.dart';

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
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(kPaddingDefault/2)),
        padding: EdgeInsets.all(getProportionateScreenWidth(kMarginDefault - 2)),
        height: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(60),
        decoration: const BoxDecoration(
          color: kColorSLight,
          shape: BoxShape.circle,
        ),
        child: icon != null 
          ? SvgPicture.asset(icon!)
          : const SizedBox(),
      ),
    );
  }
}
