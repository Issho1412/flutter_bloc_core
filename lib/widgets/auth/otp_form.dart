import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/data/demo_data.dart';
import 'package:src_core_bloc/features/auth/otp_bloc.dart';
import 'package:src_core_bloc/widgets/custom_button.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/config/size_config.dart';
import '../../core/util/style/colors.dart';
import '../../core/util/style/others.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);
  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final OTPBloc _otpBloc = OTPBloc();

  @override
  void initState() {
    super.initState();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight! * 0.04),
        CustomText(
          color: ColorConst.kTxtDefault,
          text: sOtp,
          size: getProportionateScreenWidth(StyleOthersConst.kHeadSize - 10),
          weight: StyleOthersConst.kBold,
        ),
        const CustomText(
          text: sOtpDes,
          size: StyleOthersConst.kSize - 2,
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.08),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const CustomText(
                  text: sOtpExpired,
                ),
                TweenAnimationBuilder(
                  tween: Tween(begin: 30.0, end: 0.0),
                  duration: const Duration(seconds: 30),
                  builder: (_, dynamic value, child) => Text(
                    "00:${value.toInt()}",
                    style: const TextStyle(color: ColorConst.kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
        // Start Form WIDGET
        Form(
          key: _otpBloc.formKey,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      autofocus: true,
                      obscureText: true,
                      style: const TextStyle(fontSize: StyleOthersConst.kSize * 1.7),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: StyleOthersConst.otpInputDecoration,
                      onChanged: (value) {
                        nextField(value, _otpBloc.pin2FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      focusNode: _otpBloc.pin2FocusNode,
                      obscureText: true,
                      style: const TextStyle(fontSize: StyleOthersConst.kSize * 1.7),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: StyleOthersConst.otpInputDecoration,
                      onChanged: (value) => nextField(value, _otpBloc.pin3FocusNode),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      focusNode: _otpBloc.pin3FocusNode,
                      obscureText: true,
                      style: const TextStyle(fontSize: StyleOthersConst.kSize * 1.7),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: StyleOthersConst.otpInputDecoration,
                      onChanged: (value) => nextField(value, _otpBloc.pin4FocusNode),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      focusNode: _otpBloc.pin4FocusNode,
                      obscureText: true,
                      style: const TextStyle(fontSize: StyleOthersConst.kSize * 1.7),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: StyleOthersConst.otpInputDecoration,
                      onChanged: (value) {
                        if (value.length == 1) {
                          _otpBloc.pin4FocusNode.unfocus();
                          // Then you need to check is the code is correct or not
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 2),
              ),
              CustomButton(
                text: sBtnContinue,
                bgColor: ColorConst.kPrimaryColor,
                onTap: () {},
              ),
            ],
          ),
        ),
        // End Form WIDGET
        SizedBox(height: SizeConfig.screenHeight! * 0.08),
        InkWell(
          onTap: () {},
          child: const CustomText(
            text: sResendOtp,
            underline: TextDecoration.underline,
            size: StyleOthersConst.kSize - 1,
          ),
        )
      ],
    );
  }
}
