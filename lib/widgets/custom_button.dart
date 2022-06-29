import 'package:flutter/material.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/util/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? txtColor;
  final Color? bgColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? radius;
  final Function() onTap;

  const CustomButton({
    Key? key,
    this.text,
    this.bgColor,
    this.txtColor,
    this.borderColor,
    this.width,
    this.height,
    this.radius,
    required this.onTap
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhysicalModel(
        color: Colors.grey.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * 0.075,
          width: width != null
          ? MediaQuery.of(context).size.width * width!
          : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? kPrimaryColor),
            borderRadius: BorderRadius.circular(
              radius != null ? 0 : 20
            ),
            color: bgColor ?? kTxtDefault,
          ),
          child: Container(
            margin: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: CustomText(
              text: text,
              color: txtColor ?? kTxtWhite,
              size: 18,
              weight: FontWeight.w700,
            ),
          )
        ),
      ),
    );
  }
}