import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/style/others.dart';
import '../core/util/style/colors.dart';
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
        title: CustomText(text: titleAppBar ?? '', color: ColorConst.kTxtWhite, weight: StyleOthersConst.kBold, size: StyleOthersConst.kSize + 2,),
        centerTitle: true,
        backgroundColor: ColorConst.kPrimaryColor,
      ),
      body: body ?? Container(),
      floatingActionButton: floatButton,
    );
  }
}