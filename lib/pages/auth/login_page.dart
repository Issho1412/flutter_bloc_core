import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/const.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/auth/body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BasicLayout(
        titleAppBar: sBtnLogin,
        body: Body(
          type: sBtnLogin,
        ),
      )
    );
  }
}
