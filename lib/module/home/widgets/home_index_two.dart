import 'package:flutter/material.dart';
import 'package:weather_apps_in_flutter/module/home/widgets/second_index_location_temp.dart';
import '../../../utils/app_size.dart';
import '../../../utils/asset_constant.dart';
import '../../../utils/style/style_padding.dart';
import '../widgets/home_quick_state_view.dart';
import '../widgets/home_sunrise_and_sunset_view.dart';
import 'home_main_image_view.dart';

class homeIndexTwo extends StatelessWidget {
  const homeIndexTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: StylePadding.screenPaddingMobile,
        child: Column(
          spacing: WSizes.defaultSpacing,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: WSizes.defaultSpacing,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    const HomeMainImageView(
                      imagePath: AssetConstants.sunny,
                      imageHeight: 150,
                    ),
                    const SecondIndexLocationTemp(),
                    const HomeQuickStateView(),
                    const HomeSunriseAndSunsetView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }
}
