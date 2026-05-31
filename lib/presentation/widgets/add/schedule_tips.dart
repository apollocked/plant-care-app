import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'tip_row.dart';

class ScheduleTips extends StatelessWidget {
  const ScheduleTips({
    super.key,
    required this.onSurface,
    required this.scheme,
  });
  final Color onSurface;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                size: 14,
                color: scheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                loc.commonCareTips,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: scheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TipRow(icon: '💧', text: loc.tipWater, onSurface: onSurface),
          const SizedBox(height: 4),
          TipRow(icon: '🧪', text: loc.tipFeed, onSurface: onSurface),
        ],
      ),
    );
  }
}
