import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src_core_bloc/core/util/asset_path.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import '../../core/config/size_config.dart';

class FormError extends StatelessWidget {
  final List<String>? errors;
  const FormError({
    Key? key,
    this.errors,
  }):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors?.length ?? 0, 
        (index) => Row(
          children: [
            SvgPicture.asset(
              Assets.icon.icoError,
              height: getProportionateScreenHeight(14),
              width: getProportionateScreenWidth(14),
            ),
            SizedBox(width: getProportionateScreenWidth(12),),
            CustomText(text: errors![index],)
          ],
        )

      )
    );
  }
}
