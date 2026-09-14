import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/keyboard.dart';
import 'home_logic.dart';
import 'home_screen/home_mobile.dart';
import 'home_screen/home_tablet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeLogic>();

    return GestureDetector(
      onTap: () => Keyboard.close(context: context),
      child: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) => ScreenTypeLayout.builder(
          mobile: (BuildContext context) =>
              OrientationLayoutBuilder(portrait: (BuildContext context) => HomeMobileScreen(), landscape: (BuildContext context) => HomeMobileScreen()),
          tablet: (BuildContext context) =>
              OrientationLayoutBuilder(portrait: (BuildContext context) => HomeTabletScreen(), landscape: (BuildContext context) => HomeTabletScreen()),
        ),
      ),
    );
  }
}
