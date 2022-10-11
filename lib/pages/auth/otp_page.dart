import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/core/util/style/others.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/util/style/colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/auth/body.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: sOtp, color: ColorConst.kTxtWhite, weight: StyleOthersConst.kBold,),
        centerTitle: true,
        backgroundColor: ColorConst.kPrimaryColor,
      ),
      body: const Body(type: sOtp,),
    );
  }
}
