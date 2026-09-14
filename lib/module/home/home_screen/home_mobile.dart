import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_apps_in_flutter/module/home/home_logic.dart';
import 'package:weather_apps_in_flutter/utils/style/style_padding.dart';
import '../../../utils/app_size.dart';
import '../../../utils/asset_constant.dart';
import '../widgets/home_location_and_temp_view.dart';
import '../widgets/home_main_image_view.dart';
import '../widgets/home_quick_state_view.dart';
import '../widgets/home_search_location_view.dart';
import '../widgets/home_sunrise_and_sunset_view.dart';
import '../widgets/shimmer_view.dart';

class HomeMobileScreen extends GetView<HomeLogic> {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if(controller.isLoading.isTrue) {
          return ShimmerView();
        }

        return SafeArea(
          child: Padding(
            padding: StylePadding.screenPaddingMobile,
            child: Column(
              spacing: WSizes.defaultSpacing,
              children: <Widget>[
                const HomeSearchLocationView(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: WSizes.defaultSpacing,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const HomeMainImageView(imagePath: AssetConstants.partyCloudy, imageHeight: 200),
                        const HomeLocationAndTempView(),
                        const HomeQuickStateView(),
                        const HomeSunriseAndSunsetView(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

