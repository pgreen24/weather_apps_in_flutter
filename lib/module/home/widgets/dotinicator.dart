import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import '../home_logic.dart';

class DotIndicator extends GetView<HomeLogic> {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    const int pageCount = 3;

    return Obx(() {
      return Center(
        child: DotsIndicator(
          dotsCount: pageCount,

          position: controller.currentPageIndex.value.toDouble(),

          onTap: (position) {
            int targetPage = position.toInt();
            controller.updatePageIndex(targetPage);

            controller.pageController.animateToPage(
              targetPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          decorator: DotsDecorator(
            activeColor: CupertinoColors.activeBlue,
            color: CupertinoColors.systemGrey4,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      );
    });
  }
}
