import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/data/demo_data.dart';
import 'package:src_core_bloc/features/auth/forgot_password_bloc.dart';
import 'package:src_core_bloc/routes.dart';
import 'package:src_core_bloc/widgets/custom_button.dart';
import 'package:src_core_bloc/widgets/custom_input.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/config/colors.dart';
import '../../core/config/size_config.dart';
import '../../core/util/helper.dart';
import '../../core/config/constants.dart';
import 'form_error.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);
  @override
    _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final ForgotPasswordBloc _bloc = ForgotPasswordBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight! * 0.04),
        CustomText(
          color: AppColors.kTxtDefault,
          text: sBtnForgotPassword, 
          size: getProportionateScreenWidth(AppConstants.kHeadSize - 10),
          weight: AppConstants.kBold,
        ),
        const CustomText(
          text: sClickLinkToReset,
          size: AppConstants.kSize - 2,
        ),            
        SizedBox(height: SizeConfig.screenHeight! * 0.08),
        Form(
          key: _bloc.formKey,
          child: Column(
            children: [
             CustomInput(
                type: TextInputType.emailAddress,
                labelTxt: sEmail,
                controller: _bloc.emailEditingController, 
                placeHolder: sHintEmailInput,
              ),
              SizedBox(height: getProportionateScreenHeight(AppConstants.kHeightDefault/2),),
              FormError(errors: _bloc.errors),
              SizedBox(height: getProportionateScreenHeight(AppConstants.kHeightDefault/2),),
              CustomButton(
                bgColor: AppColors.kPrimaryColor,
                text: sBtnContinue, onTap: (){
                  Helper().navigateTo(otpRoute);
                }
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
            ]
          )
        )
      ],
    );
  }
}
