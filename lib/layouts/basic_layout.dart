import 'package:flutter/material.dart';
import '../core/util/colors.dart';
import '../widgets/custom_text.dart';

class BasicLayout extends StatelessWidget {
  final String? titleAppBar;
  final Widget? body;
  final Widget floatButton;
  final bool showAppBar;
  final bool showLeading;

  const BasicLayout({
    Key? key,
    this.titleAppBar,
    this.body,
    required this.floatButton,
    this.showAppBar = true,
    this.showLeading = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !showAppBar ? null : AppBar(
        automaticallyImplyLeading: showLeading,
        title: CustomText(text: titleAppBar ?? '', color: kTxtWhite, weight: kBold, size: kSize + 2,),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: body ?? Container(),
      floatingActionButton: floatButton,
    );
  }
}