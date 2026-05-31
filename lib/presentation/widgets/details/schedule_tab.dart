import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/presentation/widgets/settings/glass_container.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'schedule_components.dart';
import 'notification_toggle.dart';
import 'edit_schedule_dialog.dart';

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({super.key, required this.plant, required this.vm});

  final PlantModel plant;
  final PlantViewModel vm;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color onSurface = scheme.onSurface;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        children: [
          _EditableScheduleCard(
            title: loc.scheduleCardIntervals,
            onSurface: onSurface,
            onEdit: () => showDialog(
              context: context,
              builder: (_) => EditScheduleDialog(plant: plant, vm: vm),
            ),
            children: [
              ScheduleRow(
                icon: Icons.water_drop_outlined,
                color: Colors.blue,
                label: loc.scheduleWatering,
                value: loc.scheduleEveryNDays(plant.waterIntervalDays),
                onSurface: onSurface,
              ),
              const Divider(height: 20),
              ScheduleRow(
                icon: Icons.grass_outlined,
                color: Colors.orange,
                label: loc.scheduleFeeding,
                value: loc.scheduleEveryNDays(plant.feedIntervalDays),
                onSurface: onSurface,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _EditableScheduleCard(
            title: loc.scheduleCardReminders,
            onSurface: onSurface,
            onEdit: () => showDialog(
              context: context,
              builder: (_) => EditScheduleDialog(plant: plant, vm: vm),
            ),
            children: [
              ScheduleRow(
                icon: Icons.water_drop_outlined,
                color: Colors.blue,
                label: loc.scheduleWaterReminder,
                value: plant.waterReminderTime.format(context),
                onSurface: onSurface,
              ),
              const Divider(height: 20),
              ScheduleRow(
                icon: Icons.grass_outlined,
                color: Colors.orange,
                label: loc.scheduleFeedReminder,
                value: plant.feedReminderTime.format(context),
                onSurface: onSurface,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ScheduleInfoCard(
            title: loc.scheduleCardUpcoming,
            onSurface: onSurface,
            children: [
              UpcomingDateRow(
                icon: Icons.water_drop_outlined,
                color: Colors.blue,
                label: loc.scheduleNextWatering,
                date: plant.nextWaterDue,
                isOverdue: plant.needsWaterNow,
                onSurface: onSurface,
              ),
              const Divider(height: 20),
              UpcomingDateRow(
                icon: Icons.grass_outlined,
                color: Colors.orange,
                label: loc.scheduleNextFeeding,
                date: plant.nextFoodDue,
                isOverdue: plant.needsFoodNow,
                onSurface: onSurface,
              ),
            ],
          ),
          const SizedBox(height: 12),
          NotificationToggleCard(
            plant: plant,
            vm: vm,
            scheme: scheme,
            onSurface: onSurface,
          ),
        ],
      ),
    );
  }
}

class _EditableScheduleCard extends StatelessWidget {
  const _EditableScheduleCard({
    required this.title,
    required this.onSurface,
    required this.children,
    required this.onEdit,
  });

  final String title;
  final Color onSurface;
  final List<Widget> children;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: onSurface,
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: Icon(
                  Icons.edit_outlined,
                  size: 18,
                  color: onSurface.withValues(alpha: 0.5),
                ),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}

class _ScheduleInfoCard extends StatelessWidget {
  const _ScheduleInfoCard({
    required this.title,
    required this.onSurface,
    required this.children,
  });

  final String title;
  final Color onSurface;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: onSurface,
            ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}
