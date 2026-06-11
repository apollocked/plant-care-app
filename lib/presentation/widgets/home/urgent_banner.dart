import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/core/theme/app_colors.dart';

class UrgentBanner extends StatelessWidget {
  const UrgentBanner({super.key, required this.urgentCount});

  final int urgentCount;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.warning.withValues(alpha: isDark ? 0.25 : 0.15),
            AppColors.error.withValues(alpha: isDark ? 0.15 : 0.08),
          ],
        ),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: AppColors.warning,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loc.urgentBannerTitle(urgentCount),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppColors.warning,
                  ),
                ),
                Text(
                  loc.urgentBannerSubtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.warning.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.warning,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
