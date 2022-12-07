import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/core/config/constants.dart';
import 'package:src_core_bloc/features/splash/bloc/splash_bloc.dart';
import 'package:src_core_bloc/routes.dart';
import 'package:src_core_bloc/widgets/custom_button.dart';
import '../../../core/config/colors.dart';
import '../../../core/config/size_config.dart';
import '../../../data/demo_data.dart';
import 'splash_item.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final SplashBloc _splashBloc = SplashBloc();

  AnimatedContainer buildDot({int index = 0}) {
    return AnimatedContainer(
      duration: AppConstants.kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: AppConstants.kHeightDot,
      width:
          _splashBloc.currentPage == index ? 20 : AppConstants.kHeightDot,
      decoration: BoxDecoration(
        color: _splashBloc.currentPage == index
            ? AppColors.kPrimaryColor
            : AppColors.kColorDotOpacity,
        borderRadius: BorderRadius.circular(AppConstants.kRadius / 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  _splashBloc.updatePageIndex(value);
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashItem(
                  image: splashData[index][sAttImage] ?? '',
                  text: splashData[index][sAttText] ?? '',
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(
                        AppConstants.kPaddingDefault)),
                child: Column(
                  children: [
                    const Spacer(),
                    BlocBuilder<SplashBloc, BaseState>(
                      bloc: _splashBloc,
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(splashData.length,
                              (index) => buildDot(index: index)),
                        );
                      },
                    ),
                    const Spacer(),
                    CustomButton(
                        bgColor: AppColors.kPrimaryColor,
                        text: sBtnContinue,
                        onTap: () {
                          Helper().navigateTo(loginRoute);
                        }),
                    const Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
