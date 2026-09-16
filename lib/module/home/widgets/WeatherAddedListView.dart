import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_size.dart';
import '../../../utils/apps_color.dart';
import '../home_logic.dart';
import 'home_main_image_view.dart';

class WeatherAddedListView extends StatelessWidget {
  const WeatherAddedListView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLogic controller = Get.find<HomeLogic>();

    return Material(
      color: Colors.transparent,
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
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 8.0, bottom: 8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Get.isDarkMode ? AppsColor.white : AppsColor.black,
                      size: 20,
                    ),
                  ),
                ),
                Text(
                  'Favourite Cities',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ) ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),


            Obx(() {
              if (controller.addedCitiesList.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('No cities added yet!', style: TextStyle(color: Colors.grey)),
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.addedCitiesList.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final cityData = controller.addedCitiesList[index];


                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {

                      controller.updateHomeWeatherData(
                        cityData['city']!,
                        cityData['temp']!,
                        cityData['icon']!,
                      );


                      controller.searchedCity.value = cityData['city']!;
                      controller.temperature.value = cityData['temp']!;
                      controller.weatherIconPath.value = cityData['icon']!;


                      Get.back();
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: WSizes.defaultSpacing, horizontal: WSizes.defaultSpacing - 6),
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
                                cityData['city']!,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode ? AppsColor.white : AppsColor.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                cityData['temp']!,
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                  color: Get.isDarkMode ? AppsColor.white : AppsColor.black,
                                ),
                              ),
                              const SizedBox(width: 10),
                              HomeMainImageView(
                                imagePath: cityData['icon']!,
                                imageWidth: 50,
                                imageHeight: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
