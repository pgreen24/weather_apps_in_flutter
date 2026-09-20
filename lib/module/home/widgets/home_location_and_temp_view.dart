import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_size.dart';
import '../../../utils/asset_constant.dart';

import '../home_logic.dart';
import 'home_main_image_view.dart';

class HomeLocationAndTempView extends GetView<HomeLogic> {
  const HomeLocationAndTempView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        spacing: WSizes.defaultSpacing,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: WSizes.iconSm - 5,
            children: [
              Text(
                controller.homeCity.value,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 42,
                  letterSpacing: 0.95,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const HomeMainImageView(
                imagePath: AssetConstants.locationIcon,
                imageWidth: 20,
                imageHeight: 20,
              )
            ],
          ),
          Text(
            controller.homeTemp.value,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 60,
              letterSpacing: 0.95,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      );
    });
  }
}
