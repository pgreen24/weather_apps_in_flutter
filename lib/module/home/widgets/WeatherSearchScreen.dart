import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_size.dart';
import '../../../utils/apps_color.dart';
import '../../../utils/asset_constant.dart';
import '../home_logic.dart';
import 'home_main_image_view.dart';
import 'weather_add_list.dart';

class WeatherSearchScreen extends GetView<HomeLogic> {
  const WeatherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              children: [

                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 8.0, bottom: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Get.isDarkMode ? AppsColor.white : AppsColor.black,
                      size: 20,
                    ),
                  ),
                ),


                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7F9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: controller.searchController,
                      onSubmitted: (value) => controller.performSearch(value),
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: 'Search Location',
                        hintStyle: TextStyle(color: Colors.black26),
                        suffixIcon: Icon(Icons.search, color: Colors.black38),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),


            Obx(() => Wrap(
              spacing: 10,
              runSpacing: 8,
              children: controller.searchHistory.map((city) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.searchController.text = city;
                          controller.performSearch(city);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0, right: 4.0),
                          child: Text(
                            city,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.removeFromHistory(city),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10.0, left: 4.0),
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            )),
            const SizedBox(height: 24),

            Obx(() {
              if (controller.searchedCity.value.isEmpty) {
                return const SizedBox.shrink();
              }

              return GestureDetector(
                onTap: () {
                  Get.to(() => const WeatherAddList());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(WSizes.defaultSpacing + 4),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? AppsColor.darkerGrey.withValues(alpha: 0.5) : AppsColor.white,
                    borderRadius: BorderRadius.circular(WSizes.borderRadiusMd),
                    border: Border.all(color: AppsColor.darkGrey.withValues(alpha: 0.5), width: 0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.searchedCity.value,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ) ?? const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            controller.temperature.value,
                            style: Theme.of(context).textTheme.displayMedium ?? const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      HomeMainImageView(
                        imagePath: controller.weatherIconPath.value.isEmpty
                            ? AssetConstants.sunny
                            : controller.weatherIconPath.value,
                        imageWidth: 90,
                        imageHeight: 90,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
