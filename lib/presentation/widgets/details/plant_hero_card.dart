import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/presentation/widgets/settings/glass_container.dart';

class PlantHeroCard extends StatelessWidget {
  const PlantHeroCard({super.key, required this.plant});

  final PlantModel plant;

  double _healthScore() {
    if (!plant.needsWaterNow && !plant.needsFoodNow) return 1.0;
    if (plant.needsWaterNow && plant.needsFoodNow) return 0.2;
    return 0.6;
  }

  Color _healthColor() {
    final double s = _healthScore();
    if (s >= 0.9) return Colors.green;
    if (s >= 0.5) return Colors.orange;
    return Colors.red;
  }

  String _healthLabel(AppLocalizations loc) {
    final double s = _healthScore();
    if (s >= 0.9) return loc.healthThriving2;
    if (s >= 0.5) return loc.healthNeedsCare2;
    return loc.healthUrgent2;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color onSurface = scheme.onSurface;

    return GlassContainer(
      borderRadius: 22,
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          _HealthRing(healthScore: _healthScore(), healthColor: _healthColor()),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: onSurface,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  plant.species?.isNotEmpty == true
                      ? plant.species!
                      : loc.unknownSpecies,
                  style: TextStyle(
                    fontSize: 13,
                    color: onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    StatusPill(label: _healthLabel(loc), color: _healthColor()),
                    StatusPill(
                      label: plant.remindersEnabled
                          ? loc.remindersOn
                          : loc.remindersOff,
                      color: scheme.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthRing extends StatelessWidget {
  const _HealthRing({required this.healthScore, required this.healthColor});

  final double healthScore;
  final Color healthColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 72,
          height: 72,
          child: CircularProgressIndicator(
            value: healthScore,
            strokeWidth: 4,
            backgroundColor: healthColor.withValues(alpha: 0.15),
            valueColor: AlwaysStoppedAnimation<Color>(healthColor),
          ),
        ),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: healthColor.withValues(alpha: 0.1),
          ),
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/icons/plant_icon.png',
            fit: BoxFit.contain,
            cacheWidth: 112,
            cacheHeight: 112,
          ),
        ),
      ],
    );
  }
}

class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
