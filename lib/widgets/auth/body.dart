import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/config/size_config.dart';
import 'package:src_core_bloc/core/const.dart';
import 'forgot_password_form.dart';
import 'login_form.dart';
import 'otp_form.dart';
import 'register_form.dart';

class Body extends StatelessWidget {
  final String type;
  const Body({
    Key? key, 
    required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _widget = Container();
    if (type == sBtnLogin) {
      _widget = const LoginForm();
    }
    if (type == sBtnRegister) {
      _widget = const RegisterForm();
    }
    if (type == sBtnForgotPassword) {
      _widget = const ForgotPasswordForm();
    }
    if (type == sOtp) {
      _widget = const OTPForm();
    }

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(child: _widget),
        ),
      )
    );
  }
}
