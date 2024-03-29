import 'package:flutter/material.dart';
import 'package:src_core_bloc/data/demo_data.dart';
import 'package:src_core_bloc/widgets/custom_image.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../../core/config/size_config.dart';
import 'package:src_core_bloc/core/config/colors.dart';
import '../../../core/config/constants.dart';

class SplashItem extends StatelessWidget {
  const SplashItem({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        CustomText(
          text: sAppName,
          color: AppColors.kPrimaryColor,
          size: getProportionateScreenHeight(AppConstants.kHeadSize),
          weight: AppConstants.kBold,
        ),
        CustomText(text: text,),
        const Spacer(flex: 2),
        CustomImage(
          imgUrl: image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
