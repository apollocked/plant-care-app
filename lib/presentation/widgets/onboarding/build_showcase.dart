import 'package:flutter/material.dart';
import 'package:plant_care_app/core/theme/app_colors.dart';
import 'package:showcaseview/showcaseview.dart';

Widget buildShowcase({
  required GlobalKey key,
  required String title,
  required String description,
  required Widget child,
  required bool isDark,
  BorderRadius? targetBorderRadius,
  ShapeBorder? targetShapeBorder,
  BuildContext? context,
}) {
  const double kOverlayOpacity = 0.78;
  final Color bg = isDark ? AppColors.tooltipBgDark : AppColors.tooltipBg;
  return Showcase(
    key: key,

    title: title,
    description: description,

    tooltipBackgroundColor: bg,
    tooltipBorderRadius: BorderRadius.circular(20),
    textColor: Colors.white,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.2,
    ),
    descTextStyle: TextStyle(
      color: Colors.white.withValues(alpha: 0.82),
      fontSize: 13,
      height: 1.45,
      fontWeight: FontWeight.w400,
    ),

    targetBorderRadius: targetBorderRadius ?? BorderRadius.circular(16),
    targetShapeBorder: targetShapeBorder ?? const RoundedRectangleBorder(),

    overlayColor: AppColors.overlay,
    overlayOpacity: kOverlayOpacity,

    movingAnimationDuration: const Duration(milliseconds: 550),
    child: child,
  );
}
