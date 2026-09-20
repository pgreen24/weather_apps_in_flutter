import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_apps_in_flutter/module/home/home_logic.dart';
import 'package:weather_apps_in_flutter/utils/style/style_padding.dart';
import '../../../utils/asset_constant.dart';
import '../widgets/dotinicator.dart';
import '../widgets/favorute_city.dart';
import '../widgets/home_index_one.dart';
import '../widgets/home_index_two.dart';
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
        if (controller.isLoading.isTrue) {
          return const ShimmerView();
        }

        final List<Widget> pages = [
          const homeIndexOne(),
          const HomeFirstPageWidgets(),
          const homeIndexTwo(),
        ];

        return SafeArea(
          child: Padding(
            padding: StylePadding.screenPaddingMobile,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HomeSearchLocationView(),
                const SizedBox(height: 10),
                const DotIndicator(),
                const FavoruteCity(),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.updatePageIndex(index);
                    },
                    children: pages,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}


class HomeFirstPageWidgets extends GetView<HomeLogic> {
  const HomeFirstPageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            HomeMainImageView(
              imagePath: controller.homeIcon.value,
              imageHeight: 200,
            ),
            const HomeLocationAndTempView(),
            const HomeQuickStateView(),
            const HomeSunriseAndSunsetView(),
          ],
        );
      }),
    );
  }
}

