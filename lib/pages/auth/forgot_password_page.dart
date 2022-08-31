import 'package:src_core_bloc/core/const.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/auth/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BasicLayout(
        titleAppBar: sBtnForgotPassword,
        body: Body(type: sBtnForgotPassword,),
      ) 
    );
  }
}
