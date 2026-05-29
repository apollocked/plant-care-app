// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/presentation/widgets/settings/glass_container.dart';
import 'form_helpers.dart';
import 'time_tile.dart';

class ReminderSection extends StatelessWidget {
  const ReminderSection({
    super.key,
    required this.remindersEnabled,
    required this.waterTime,
    required this.feedTime,
    required this.onToggleReminders,
    required this.onPickWaterTime,
    required this.onPickFeedTime,
    required this.onSurface,
  });

  final bool remindersEnabled;
  final TimeOfDay waterTime;
  final TimeOfDay feedTime;
  final ValueChanged<bool> onToggleReminders;
  final VoidCallback onPickWaterTime;
  final VoidCallback onPickFeedTime;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return GlassContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormSectionHeader(
                icon: '🔔',
                label: loc.sectionReminders,
                onSurface: onSurface,
              ),
              Switch.adaptive(
                value: remindersEnabled,
                onChanged: onToggleReminders,
                activeColor: scheme.primary,
              ),
            ],
          ),
          if (remindersEnabled) ...[
            const SizedBox(height: 12),
            TimeTile(
              label: loc.labelWateringReminder,
              time: waterTime,
              onTap: onPickWaterTime,
              icon: Icons.water_drop_rounded,
              color: Colors.blue.shade400,
              onSurface: onSurface,
            ),
            const SizedBox(height: 8),
            TimeTile(
              label: loc.labelFeedingReminder,
              time: feedTime,
              onTap: onPickFeedTime,
              icon: Icons.grass_rounded,
              color: Colors.green.shade500,
              onSurface: onSurface,
            ),
          ] else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                loc.remindersDisabled,
                style: TextStyle(
                  fontSize: 12,
                  color: onSurface.withValues(alpha: 0.4),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
