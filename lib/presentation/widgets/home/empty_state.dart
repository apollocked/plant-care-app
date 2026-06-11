import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/core/theme/app_colors.dart';

class EmptyPlantState extends StatelessWidget {
  const EmptyPlantState({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    scheme.primary.withValues(alpha: 0.35),
                    scheme.primary.withValues(alpha: 0.12),
                  ],
                ),
                border: Border.all(
                  color: scheme.primary.withValues(alpha: 0.2),
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/empty.png',
                fit: BoxFit.fill,
                cacheWidth: 280,
                cacheHeight: 280,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              loc.noPlantsYet,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : AppColors.emptyStateText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              loc.noPlantsDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: isDark
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.black.withValues(alpha: 0.45),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    scheme.primary.withValues(alpha: 0.15),
                    scheme.primary.withValues(alpha: 0.05),
                  ],
                ),
                border: Border.all(
                  color: scheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                loc.noPlantsHint,
                style: TextStyle(
                  color: scheme.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
