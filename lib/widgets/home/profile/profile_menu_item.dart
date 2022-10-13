import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import 'package:src_core_bloc/core/util/style/others.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';

class ProfileMenuItem extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function? press; 

  const ProfileMenuItem({
    Key? key,
    @required this.text,
    @required this.icon,
    this.press,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleOthersConst.kPaddingDefault,
        vertical: StyleOthersConst.kPaddingDefault / 2
      ),
      child:TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: ColorConst.kPrimaryColor,
          padding: const EdgeInsets.all(StyleOthersConst.kPaddingDefault),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: ColorConst.kColorSLight,
        ),
        child: Row(
          children: [
            Icon(icon,),
            const SizedBox(width: StyleOthersConst.kPaddingDefault,),
            Expanded(
              child: CustomText(
                text: text,
                align: TextAlign.left,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios, 
              size: StyleOthersConst.kSize ,
              color: ColorConst.kTextColor,
            )
          ],
        ),
      ),
    );
  }
}