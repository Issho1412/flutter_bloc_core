import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/config/constants.dart';
import '../core/config/colors.dart';
import '../widgets/custom_text.dart';

class BasicLayout extends StatelessWidget {
  final String? titleAppBar;
  final Widget? body;
  final Widget? floatButton;
  final bool showAppBar;
  final bool showLeading;

  const BasicLayout({
    Key? key,
    this.titleAppBar,
    this.body,
    this.floatButton,
    this.showAppBar = true,
    this.showLeading = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !showAppBar ? null : AppBar(
        automaticallyImplyLeading: showLeading,
        title: CustomText(text: titleAppBar ?? '', color: AppColors.kTxtWhite, weight: AppConstants.kBold, size: AppConstants.kSize + 2,),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: body ?? Container(),
      floatingActionButton: floatButton,
    );
  }
}
