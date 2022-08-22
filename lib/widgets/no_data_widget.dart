import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/colors.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key, this.text = 'No data'}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            color: kTextColor.withOpacity(0.1),
            child: Center(
                child: Text(
              text,
              style: const TextStyle(color: kTxtDefault)
            )),
          ),
        ),
      ],
    );
  }
}
