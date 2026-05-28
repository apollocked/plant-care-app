import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/care_status_card.dart';
import 'package:mock_plant_care_app/presentation/widgets/glass_container.dart';

class CareInfoTab extends StatelessWidget {
  const CareInfoTab({super.key, required this.plant});

  final PlantModel plant;

  String _timeAgo(DateTime dt, AppLocalizations loc) {
    final Duration d = DateTime.now().difference(dt);
    if (d.inDays > 0) return loc.daysAgo(d.inDays);
    if (d.inHours > 0) return loc.hoursAgo(d.inHours);
    return loc.justNow;
  }

  String _dueLabel(String label, DateTime dueAt) {
    return '$label: ${DateFormat('MMM d, h:mm a').format(dueAt)}';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final List<Map<String, String>> tips = <Map<String, String>>[
      {'icon': '💧', 'text': loc.tipWaterInterval(plant.waterIntervalDays)},
      {'icon': '🌿', 'text': loc.tipFeedInterval(plant.feedIntervalDays)},
      {'icon': '☀️', 'text': loc.tipSunlight},
      {'icon': '🌡️', 'text': loc.tipTemperature},
      {'icon': '🪴', 'text': loc.tipPests},
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CareStatusCard(
            icon: Icons.water_drop_outlined,
            color: Colors.blue,
            title: loc.careCardWatering,
            okLabel: loc.careCardWatered,
            urgentLabel: loc.careCardWaterNow,
            isUrgent: plant.needsWaterNow,
            lastActionLabel: loc.lastWatered(
              _timeAgo(plant.lastWateredAt, loc),
            ),
            lastActionAt: plant.lastWateredAt,
            nextDueAt: plant.nextWaterDue,
            nextDueLabel: _dueLabel(
              loc.scheduleNextWatering,
              plant.nextWaterDue,
            ),
            intervalLabel: loc.everyNDays(plant.waterIntervalDays),
            onSurface: onSurface,
          ),
          const SizedBox(height: 12),
          CareStatusCard(
            icon: Icons.grass_outlined,
            color: Colors.orange,
            title: loc.careCardFeeding,
            okLabel: loc.careCardFed,
            urgentLabel: loc.careCardFeedNow,
            isUrgent: plant.needsFoodNow,
            lastActionLabel: loc.lastFed(_timeAgo(plant.lastFedAt, loc)),
            lastActionAt: plant.lastFedAt,
            nextDueAt: plant.nextFoodDue,
            nextDueLabel: _dueLabel(
              loc.scheduleNextFeeding,
              plant.nextFoodDue,
            ),
            intervalLabel: loc.everyNDays(plant.feedIntervalDays),
            onSurface: onSurface,
          ),
          const SizedBox(height: 20),
          Text(
            loc.careTipsHeading,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: onSurface,
            ),
          ),
          const SizedBox(height: 10),
          ...tips.map(
            (Map<String, String> t) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlassContainer(
                borderRadius: 14,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Text(t['icon']!, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        t['text']!,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: onSurface.withValues(alpha: 0.75),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
