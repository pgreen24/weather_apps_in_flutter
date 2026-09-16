import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'WeatherAddedListView.dart';

class FavoruteCity extends StatelessWidget {
  const FavoruteCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              const WeatherAddedListView(),
              backgroundColor: Get.isDarkMode ? Colors.black.withOpacity(0.9) : Colors.white,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            );
          },
          child: const Text("Open Add List"),
        ),
      ],
    );
  }
}
