import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/config/colors.dart';

class CustomInput extends StatelessWidget {
  final String? placeHolder;
  final String? labelTxt;
  final bool? isHint;
  final TextEditingController controller;
  final double? radiusPx;
  final TextInputType? type;
  final Icon? preIcon;
  // final Function(String val)? onChanged;

  const CustomInput({
    Key? key,
    required this.controller,
    this.placeHolder,
    this.type,
    this.labelTxt,
    this.radiusPx,
    this.preIcon,
    this.isHint = false
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value){
      //   if(value?.isEmpty ?? false){
      //     return '';
      //   }
      //   return null;
      // },
      controller: controller,
      keyboardType: type ?? TextInputType.text,
      obscureText: isHint ?? false,
      decoration: InputDecoration(
        hintText: placeHolder ?? '',
        labelText: labelTxt ?? '',
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.kTextColor
        ),
        prefixIcon: preIcon,
        hintStyle: const TextStyle(fontSize: 14.0),
      ),
    );
  }
}
