import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.count,
    required this.onSurface,
    required this.scheme,
  });

  final int count;
  final Color onSurface;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Row(
        children: [
          Text(
            loc.myPlants,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: onSurface,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: scheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: scheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
