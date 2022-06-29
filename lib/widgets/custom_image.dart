// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/util/colors.dart';

class CustomImage extends StatelessWidget {
  final String imgUrl;
  final double? height; 
  final double? width;
  final BoxFit? fit;
  final bool networkImg;

  const CustomImage({
    Key? key,
    required this.imgUrl,
    this.height,
    this.width,
    this.fit,
    this.networkImg = false,
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    if(networkImg && imgUrl.isNotEmpty) {
      return CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: imgUrl,
        height: height ?? kHeightDefault,
        width: width ?? kHeightDefault,
      );
    }

    return Image(
      height: height ?? 50,
      fit: fit ?? BoxFit.contain,
      image: AssetImage(
        imgUrl
      ));
  }
}