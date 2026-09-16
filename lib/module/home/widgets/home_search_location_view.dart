

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_logic.dart';
import 'WeatherSearchScreen.dart';


class HomeSearchLocationView extends GetView<HomeLogic> {
  const HomeSearchLocationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {

        Get.to(() => const WeatherSearchScreen());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const AbsorbPointer(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search location',
              hintStyle: TextStyle(color: Colors.black26),
              suffixIcon: Icon(Icons.search, color: Colors.black38),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
