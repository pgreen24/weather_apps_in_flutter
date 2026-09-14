import 'package:flutter/material.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import '../../../utils/app_size.dart';
import '../../../utils/asset_constant.dart';
import 'home_location_and_temp_view.dart';
import 'home_main_image_view.dart';
import 'home_quick_state_view.dart';
import 'home_sunrise_and_sunset_view.dart';

class HomeFirstPageContent extends StatelessWidget {
  const HomeFirstPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: WSizes.defaultSpacing,
        mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(height: 50),
        HomeMainImageView(imagePath: AssetConstants.partyCloudy, imageHeight: 200),
        HomeLocationAndTempView(),
        HomeQuickStateView(),
        HomeSunriseAndSunsetView(),
      ],
    );
  }
}
