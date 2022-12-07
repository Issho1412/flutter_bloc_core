import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/snackbar.dart';
import 'package:src_core_bloc/core/config/constants.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppConstants.kPaddingDefault),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("LOAD VIDEO"),
              onPressed: () async {
                showSnackBar('Error');
              },
            ),
          ],
        ),
      )
    );
  }
}
