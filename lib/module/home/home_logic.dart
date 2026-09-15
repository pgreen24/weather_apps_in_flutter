import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isDarkMode = false.obs;


  var currentPageIndex = 1.obs;


  final PageController pageController = PageController(initialPage: 1);

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = Get.isDarkMode;
    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  void updatePageIndex(int index) {
    currentPageIndex.value = index;
  }

  @override
  void onClose() {
    searchController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
