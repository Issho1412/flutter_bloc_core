import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src_core_bloc/core/base/base_source_device.dart';
import 'package:src_core_bloc/core/util/asset_path.dart';
import 'package:src_core_bloc/core/config/colors.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg'
            )
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: AppColors.kTxtWhite),
                  ),
                  primary: Colors.white,
                  backgroundColor: AppColors.kColorSLight,
                ),
                onPressed: () {
                  BaseSourceDevice.getImgFromCamera();
                },
                child: SvgPicture.asset(Assets.icon.icoCamera),
              ),
            ),
          )
        ],
      ),
    );
  }
}
