import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import '../home_logic.dart';
import 'HomeFirstPageContent.dart';
import 'home_index_one.dart';
import 'home_index_two.dart';


class DotIndicator extends GetView<HomeLogic> {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      const HomeFirstPageContent(),
      const homeIndexOne(),
      const homeIndexTwo(),
    ];

    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          SizedBox(
            height: 400,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: pages.length,
              onPageChanged: controller.updatePageIndex,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: DotsIndicator(
              dotsCount: pages.length,
              position: controller.currentPageIndex.value.toDouble(),
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
          ),
        ],
      );
    });
  }
}
