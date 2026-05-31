import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'feature_pill.dart';

class FeaturePillsRow extends StatelessWidget {
  const FeaturePillsRow({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FeaturePill(
          icon: Icons.water_drop_outlined,
          label: loc.pillWater,
          color: Colors.blue,
          isDark: isDark,
        ),
        const SizedBox(width: 8),
        FeaturePill(
          icon: Icons.grass_outlined,
          label: loc.pillFeed,
          color: Colors.green,
          isDark: isDark,
        ),
        const SizedBox(width: 8),
        FeaturePill(
          icon: Icons.wb_sunny_outlined,
          label: loc.pillLight,
          color: Colors.orange,
          isDark: isDark,
        ),
      ],
    );
  }
}
