import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
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
            nextDueLabel:
                'Next: ${DateFormat('MMM d, h:mm a').format(plant.nextWaterDue)}',
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
            nextDueLabel:
                'Next: ${DateFormat('MMM d, h:mm a').format(plant.nextFoodDue)}',
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

class CareStatusCard extends StatelessWidget {
  const CareStatusCard({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.okLabel,
    required this.urgentLabel,
    required this.isUrgent,
    required this.lastActionLabel,
    required this.nextDueLabel,
    required this.intervalLabel,
    required this.onSurface,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String okLabel;
  final String urgentLabel;
  final bool isUrgent;
  final String lastActionLabel;
  final String nextDueLabel;
  final String intervalLabel;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    final Color active = isUrgent ? color : Colors.green;
    return GlassContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 18, color: color),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: onSurface,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: active.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: active.withValues(alpha: 0.3)),
                ),
                child: Text(
                  isUrgent ? urgentLabel : okLabel,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: active,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: isUrgent ? 1.0 : 0.55,
              backgroundColor: active.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation(active),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.history_rounded,
                size: 13,
                color: onSurface.withValues(alpha: 0.4),
              ),
              const SizedBox(width: 5),
              Text(
                lastActionLabel,
                style: TextStyle(
                  fontSize: 12,
                  color: onSurface.withValues(alpha: 0.6),
                ),
              ),
              const Spacer(),
              Text(
                intervalLabel,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: color.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            nextDueLabel,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isUrgent ? FontWeight.w600 : FontWeight.w400,
              color: isUrgent ? color : onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
