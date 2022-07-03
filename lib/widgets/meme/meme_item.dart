// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:src_core_bloc/core/util/colors.dart';
import 'package:src_core_bloc/data/models/meme/meme.dart';
import 'package:flutter/material.dart';
import '../custom_text.dart';

class MemeItem extends StatelessWidget{
  final MemeModel meme;

  const MemeItem({
    Key? key,
    required this.meme
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kColorSLight,
      child: Padding(
        padding: const EdgeInsets.all(kPaddingDefault/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: meme.url ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault/2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: meme.name ?? '', 
                      align: TextAlign.left,
                    ),
                    CustomText(
                      text: "${meme.width ?? 0} x ${meme.height ?? 0}",
                      size: kSize - 3,
                    ),
                    const CustomText(text: "")
                  ],
                ),
              ),
            ),
            CustomText(
              text: meme.id ?? '',
              size: kSize - 4,
            ),
          ],
        ),
      ),
    );
  }
}
