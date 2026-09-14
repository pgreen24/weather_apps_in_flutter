import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  RxBool isLoading = true.obs;

  RxBool isDarkMode = false.obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = Get.isDarkMode;
    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
