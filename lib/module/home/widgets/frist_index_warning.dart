import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../utils/app_size.dart';
import '../../../utils/apps_color.dart';

class FristIndexWarning extends StatelessWidget {
  const FristIndexWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(WSizes.defaultSpacing + 4),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? AppsColor.darkerGrey.withValues(alpha: 0.5) : AppsColor.white,
        borderRadius: BorderRadius.circular(WSizes.borderRadiusMd),
        border: Border.all(color: AppsColor.darkGrey.withValues(alpha: 0.5), width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Warning Header
                Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.amber[600],
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'WARNING',
                      style: TextStyle(
                        color: Colors.amber[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Rain & Time Columns
                Row(
                  children: [
                    // % Rain Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '% RAIN',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 0.8,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '58%',
                          style: TextStyle(
                            color: Color(0xFF8A90A2),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 32),

                    // Exp. Time Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'EXP. TIME',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 0.8,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '02:00 PM',
                          style: TextStyle(
                            color: Color(0xFF8A90A2),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Bottom Status Text
                Text(
                  'Expecting Rainfall',
                  style: TextStyle(
                    color: Colors.amber[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Right Side Image
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              'assets/image/img_1.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,

            ),
          ),
        ],
      ),
    );
  }
}
