import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/core/util/asset_path.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import 'package:src_core_bloc/features/auth/login_bloc.dart';
import 'package:src_core_bloc/routes.dart';
import 'package:src_core_bloc/widgets/auth/social_card_item.dart';
import 'package:src_core_bloc/widgets/custom_button.dart';
import 'package:src_core_bloc/widgets/custom_input.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/config/size_config.dart';
import '../../core/util/style/others.dart';
import 'form_error.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginBloc _loginBloc = LoginBloc();

  String password = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<LoginBloc, BaseState>(
        bloc:  _loginBloc,
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
              CustomText(
                color: ColorConst.kTxtDefault,
                text: sWelcomeBack,
                size: getProportionateScreenWidth(StyleOthersConst.kHeadSize - 8),
                weight: StyleOthersConst.kBold,
              ),
              const CustomText(
                color: ColorConst.kTextColor,
                text: sDeslogin,
                size: StyleOthersConst.kSize - 1,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              // Start Form WIDGET
              Form(
                key: _loginBloc.formKey,
                child: Column(
                  children: [
                    CustomInput(
                      type: TextInputType.emailAddress,
                      labelTxt: sEmail,
                      controller: _loginBloc.emailEditingController,
                      placeHolder: sHintEmailInput,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 3),
                    ),
                    CustomInput(
                      labelTxt: sPsw,
                      isHint: true,
                      controller: _loginBloc.pswEditingController,
                      placeHolder: sHintPswInput,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 3),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _loginBloc.isRemember,
                          activeColor: ColorConst.kPrimaryColor,
                          onChanged: _loginBloc.onChangeRemember
                        ),
                        const CustomText(
                          text: sBtnRememberme,
                          size: StyleOthersConst.kSize,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Helper().navigateTo(forgotRoute);
                          },
                          child: const CustomText(
                            text: sBtnForgotPassword,
                            size: StyleOthersConst.kSize,
                            underline: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    FormError(errors: _loginBloc.errors),
                    SizedBox(
                      height: getProportionateScreenHeight(StyleOthersConst.kHeightDefault / 2),
                    ),
                    CustomButton(
                        bgColor: ColorConst.kPrimaryColor,
                        text: sBtnLogin,
                        onTap: () {
                          _loginBloc.login();
                        }),
                  ],
                ),
              ),
              // End Form WIDGET
              SizedBox(height: SizeConfig.screenHeight! * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCardItem(
                    icon: Assets.icon.icoGoogle,
                    onTap: () {},
                  ),
                  SocialCardItem(
                    icon: Assets.icon.icoFacebook,
                    onTap: () {},
                  ),
                  SocialCardItem(
                    icon: Assets.icon.icoTwitter,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: sNotAccount,
                    size: StyleOthersConst.kSize,
                  ),
                  InkWell(
                    onTap: () {
                      Helper().navigateTo(registerRoute);
                    },
                    child: const CustomText(
                      text: sBtnRegister,
                      weight: StyleOthersConst.kBold,
                      color: ColorConst.kPrimaryColor,
                    )
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
