import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/apps_color.dart';
import '../../../utils/app_size.dart';
import '../../../utils/asset_constant.dart';
import '../home_logic.dart';
import '../home_view.dart';
import 'HomeFirstPageContent.dart';
import 'home_main_image_view.dart';
import 'home_quick_state_view.dart';
import 'home_sunrise_and_sunset_view.dart';

class WeatherAddList extends GetView<HomeLogic> {
  const WeatherAddList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLogic controller = Get.find<HomeLogic>();

    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: WSizes.defaultSpacing, horizontal: WSizes.defaultSpacing - 6),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? AppsColor.darkerGrey.withValues(alpha: 0.5) : AppsColor.white,
          borderRadius: BorderRadius.circular(WSizes.borderRadiusMd),
          border: Border.all(color: AppsColor.darkGrey.withValues(alpha: 0.5), width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Get.isDarkMode ? AppsColor.white : AppsColor.black,
                      size: 20,
                    ),
                  ),
                ),

                Obx(() {
                  final isAdded = controller.isAddedToList.value;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(

                      onTap: () {
                        controller.toggleCityInList();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isAdded
                              ? const Color(0xFF00875A)
                              : const Color(0xFFF7F7F9),
                          borderRadius: BorderRadius.circular(10),
                          border: isAdded ? null : Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isAdded ? 'Added to list' : 'Add to list',
                              style: TextStyle(
                                color: isAdded ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              isAdded ? Icons.check : Icons.add_circle_outline,
                              color: isAdded ? Colors.white : Colors.black87,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 16),


            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(() {
                    String displayImage = AssetConstants.sunny;
                    if (controller.searchedCity.value.toLowerCase() == 'mumbai') {
                      displayImage = AssetConstants.cloudy;
                    } else if (controller.searchedCity.value.toLowerCase() == 'hyderabad') {
                      displayImage = AssetConstants.partyCloudy;
                    }

                    return Column(
                      spacing: WSizes.defaultSpacing,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),


                        HomeMainImageView(
                          imagePath: controller.weatherIconPath.value.isEmpty
                              ? displayImage
                              : controller.weatherIconPath.value,
                          imageHeight: 180,
                        ),


                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.searchedCity.value.isEmpty ? 'Pune' : controller.searchedCity.value,
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 38,
                                  fontWeight: FontWeight.w900,
                                  color: Get.isDarkMode ? AppsColor.white : AppsColor.black
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              Icons.navigation,
                              size: 22,
                              color: Get.isDarkMode ? AppsColor.white : Colors.black87,
                            ),
                          ],
                        ),


                        Text(
                          controller.temperature.value.isEmpty ? '25°' : controller.temperature.value,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              fontSize: 76,
                              fontWeight: FontWeight.w400,
                              color: Get.isDarkMode ? AppsColor.white : AppsColor.black
                          ),
                        ),


                        const HomeQuickStateView(),
                        const HomeSunriseAndSunsetView(),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
