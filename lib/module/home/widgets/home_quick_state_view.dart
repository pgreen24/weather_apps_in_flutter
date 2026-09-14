import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_size.dart';
import '../../../utils/apps_color.dart';

class HomeQuickStateView extends StatelessWidget {
  const HomeQuickStateView({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: WSizes.defaultSpacing, horizontal: WSizes.defaultSpacing - 6),
    decoration: BoxDecoration(
      color: Get.isDarkMode ? AppsColor.darkerGrey.withValues(alpha: 0.5) : AppsColor.white,
      borderRadius: BorderRadius.circular(WSizes.borderRadiusMd),
      border: Border.all(color: AppsColor.darkGrey.withValues(alpha: 0.5), width: 0.5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatColumn(context: context, title: 'TIME', value: '11:25 AM'),
        _buildStatColumn(context: context, title: 'UV', value: '4'),
        _buildStatColumn(context: context, title: '% RAIN', value: '58%'),
        _buildStatColumn(context: context, title: 'AQ', value: '22'),
      ],
    ),
  );

  static Widget _buildStatColumn({required BuildContext context, required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
