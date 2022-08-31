import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/util/colors.dart';
import '../../widgets/auth/body.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget{
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: sBtnRegister, 
            color: kTxtWhite, 
            weight: kBold,
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: const Body(
          type: sBtnRegister,
        ),
      ));
  }
}
