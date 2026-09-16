import 'package:flutter/material.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:get/get.dart';
import '../home_logic.dart';
import 'home_location_and_temp_view.dart';
import 'home_main_image_view.dart';
import 'home_quick_state_view.dart';
import 'home_sunrise_and_sunset_view.dart';


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
                imageHeight: 200
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


