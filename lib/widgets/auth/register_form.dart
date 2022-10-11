import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/data/demo_data.dart';
import 'package:src_core_bloc/features/auth/register_bloc.dart';
import 'package:src_core_bloc/routes.dart';
import 'package:src_core_bloc/widgets/custom_button.dart';
import 'package:src_core_bloc/widgets/custom_input.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/config/size_config.dart';
import '../../core/util/style/colors.dart';
import '../../core/util/style/others.dart';
import 'form_error.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final RegisterBloc _registerBloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<RegisterBloc, BaseState>(
        bloc:  _registerBloc,
        builder: (context, state) {
          return Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                CustomText(
                  color: ColorConst.kTxtDefault,
                  text: sRegisterAccount,
                  size: getProportionateScreenWidth(StyleOthersConst.kHeadSize - 8),
                  weight: StyleOthersConst.kBold,
                ),
                const CustomText(
                  text: sDesRegister,
                  size: StyleOthersConst.kSize - 1,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                // Start Form WIDGET
                Form(
                  key: _registerBloc.formKey,
                  child: Column(
                    children: [
                      CustomInput(
                        type: TextInputType.emailAddress,
                        labelTxt: sEmail,
                        controller: _registerBloc.emailEditingController,
                        placeHolder: sHintEmailInput,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 2),
                      ),
                      CustomInput(
                          labelTxt: sPsw,
                          isHint: true,
                          controller: _registerBloc.pswEditingController,
                          placeHolder: sHintPswInput),
                      SizedBox(
                        height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 2),
                      ),
                      CustomInput(
                          labelTxt: sConfirmPassword,
                          isHint: true,
                          controller: _registerBloc.confirmPwdEditingController,
                          placeHolder: sHintPswInput),
                      SizedBox(
                        height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 2),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _registerBloc.isAgree,
                            activeColor: ColorConst.kPrimaryColor,
                            onChanged: _registerBloc.updateAgreeStatus
                          ),
                          const CustomText(
                            text: sAgreeTerm,
                            size: StyleOthersConst.kSize - 2,
                            align: TextAlign.left,
                          ),
                        ],
                      ),
                      FormError(errors: _registerBloc.errors),
                      SizedBox(
                        height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 2),
                      ),
                      CustomButton(
                          bgColor: ColorConst.kPrimaryColor,
                          text: sBtnContinue,
                          onTap: () {
                            Helper().navigateTo(loginRoute);
                          }),
                    ],
                  ),
                ),
                // End Form WIDGET
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            );
        },
      )
    );
  }
}
