import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/config/size_config.dart';
import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/core/util/asset_path.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/layouts/basic_layout.dart';
import 'package:src_core_bloc/routes.dart';
import 'package:src_core_bloc/widgets/custom_button.dart';
import 'package:src_core_bloc/widgets/custom_image.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/config/colors.dart';
import '../../core/config/constants.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: BasicLayout(
        showAppBar: false,
        body: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            CustomImage(
              imgUrl: Assets.image.imgSuccess, 
              height: SizeConfig.screenHeight! * 0.5,),
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            CustomText(
              text: sLoginSuccessful,
              weight: AppConstants.kBold,
              size: getProportionateScreenWidth(30),
              color: AppColors.kTxtDefault,
            ),
            const Spacer(),
            CustomButton(
              bgColor: AppColors.kPrimaryColor,
              width: 0.7,
              text: sBtnbackHome, onTap: (){
                Helper().navigateReplaceTo(homeRoute);
              }
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
