import 'package:flutter/material.dart';

import '../../../utils/app_size.dart';
import '../../../utils/asset_constant.dart';
import 'home_main_image_view.dart';

class SecondIndexLocationTemp extends StatelessWidget {
  const SecondIndexLocationTemp({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: WSizes.defaultSpacing,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: WSizes.iconSm - 5,
          children: [
            Text('pune', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 42, letterSpacing: 0.95, fontWeight: FontWeight.w900)),
            HomeMainImageView(
              imagePath: AssetConstants.locationIcon,
              imageWidth: 20,
              imageHeight: 20,
            )
          ],
        ),
        Text('25°', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 60, letterSpacing: 0.95, fontWeight: FontWeight.w900)),
      ],
    );
  }
}
