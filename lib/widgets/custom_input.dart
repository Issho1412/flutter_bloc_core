import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/colors.dart';

class CustomInput extends StatelessWidget {
  final String? placeHolder;
  final String? labelTxt;
  final bool? isHint;
  final TextEditingController controller;
  final double? radiusPx;
  final TextInputType? type;
  final Icon? preIcon;
  final Function(String val)? onChanged;

  const CustomInput({
    Key? key,
    required this.controller,
    this.placeHolder,
    this.onChanged,
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
      //   if(value.isEmpty){
      //     return '';
      //   }
      //   return null;
      // },
      keyboardType: type ?? TextInputType.text,
      obscureText: isHint ?? false,
      onChanged: onChanged ?? (String val){},
      decoration: InputDecoration(
        hintText: placeHolder ?? '',
        labelText: labelTxt ?? '',
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: kTextColor
        ),
        prefixIcon: preIcon,
        hintStyle: const TextStyle(fontSize: 14.0),
      ),
    );
  }
}