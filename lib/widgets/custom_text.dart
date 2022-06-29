import 'package:flutter/material.dart';
import '../../core/util/colors.dart';

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
        fontSize: size ?? kSize,
        color: color ?? kTextColor,
        fontWeight: weight ?? FontWeight.normal),
    );
  }
}