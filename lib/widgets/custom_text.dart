import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/config/colors.dart';
import 'package:src_core_bloc/core/config/constants.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  final TextDecoration? underline;
  final int? line;
  final TextOverflow? overflow;

  const CustomText({
    Key? key, 
    this.text, 
    this.size, 
    this.color, 
    this.weight, 
    this.align, 
    this.underline, 
    this.line,
    this.overflow
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: align ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: line ?? 1,
      style: TextStyle(
        decoration: underline  ?? TextDecoration.none,
        fontSize: size ?? AppConstants.kSize,
        color: color ?? AppColors.kTextColor,
        fontWeight: weight ?? FontWeight.normal),
    );
  }
}
