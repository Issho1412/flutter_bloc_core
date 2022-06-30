import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key, 
    this.strokeWidth, 
    this.padding
  }) : super(key: key);
  final double? strokeWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
          strokeWidth: strokeWidth ?? 10,
        ),
      ),
    );
  }
}