import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/core/config/constants.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../core/config/colors.dart';
import '../../widgets/auth/body.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: sOtp, color: AppColors.kTxtWhite, weight: AppConstants.kBold,),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: const Body(type: sOtp,),
    );
  }
}
