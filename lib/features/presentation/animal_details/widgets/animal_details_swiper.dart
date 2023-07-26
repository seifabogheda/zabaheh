import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';

class AnimalDetailsSwiper extends StatelessWidget {
  final String image;

  const AnimalDetailsSwiper({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CachedImage(
        url: image,
        haveRadius: true,
        borderRadius: BorderRadius.circular(8),
        height: 150,
        width: context.width,
      ),
    );
  }
}
