

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_size.dart';
import '../../../utils/apps_color.dart';

class HomeSunriseAndSunsetView extends StatelessWidget {
  const HomeSunriseAndSunsetView({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(WSizes.defaultSpacing + 4),
    decoration: BoxDecoration(
      color: Get.isDarkMode ? AppsColor.darkerGrey.withValues(alpha: 0.5) : AppsColor.white,
      borderRadius: BorderRadius.circular(WSizes.borderRadiusMd),
      border: Border.all(color: AppsColor.darkGrey.withValues(alpha: 0.5), width: 0.5),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUNRISE & SUNSET',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildSunTime('Sunrise', '06:25 AM'), _buildSunTime('Sunset', '08:30 PM', isRight: true)],
        ),
        const SizedBox(height: 12),
        // Sun Path Graph Placeholder
        SizedBox(
          height: 70,
          width: double.infinity,
          child: CustomPaint(painter: SunPathPainter()),
        ),
        const SizedBox(height: 12),
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Color(0xFF8A90A2), fontSize: 12),
            children: [
              TextSpan(text: 'Length of day: '),
              TextSpan(
                text: '13H 12M',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E2432)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Color(0xFF8A90A2), fontSize: 12),
            children: [
              TextSpan(text: 'Remaining daylight: '),
              TextSpan(
                text: '9H 22M',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E2432)),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  static Widget _buildSunTime(String label, String time, {bool isRight = false}) {
    return Column(
      crossAxisAlignment: isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppsColor.darkGrey, fontSize: 11)),
        const SizedBox(height: 2),
        Text(time, style: const TextStyle(color: AppsColor.darkGrey, fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}


// Custom Painter for Sunrise & Sunset curve
class SunPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintFill = Paint()
      ..color = const Color(0xFF76C5F0)
      ..style = PaintingStyle.fill;

    final paintNight = Paint()
      ..color = const Color(0xFF092A6D)
      ..style = PaintingStyle.fill;

    final baseLinePaint = Paint()
      ..color = const Color(0xFFD3D8E2)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double horizonY = size.height * 0.75;

    // Horizon line
    canvas.drawLine(Offset(0, horizonY), Offset(size.width, horizonY), baseLinePaint);

    // Day arc path
    final dayPath = Path()
      ..moveTo(size.width * 0.2, horizonY)
      ..quadraticBezierTo(size.width * 0.55, -5, size.width * 0.85, horizonY)
      ..close();

    // Night arc path
    final nightPath = Path()
      ..moveTo(0, horizonY)
      ..quadraticBezierTo(size.width * 0.1, size.height + 5, size.width * 0.2, horizonY)
      ..close();

    canvas.drawPath(dayPath, paintFill);
    canvas.drawPath(nightPath, paintNight);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
