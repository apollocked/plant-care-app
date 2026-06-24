import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/presentation/widgets/settings/glass_container.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';

class NotificationToggleCard extends StatelessWidget {
  const NotificationToggleCard({
    super.key,
    required this.plant,
    required this.vm,
    required this.scheme,
    required this.onSurface,
  });

  final PlantModel plant;
  final PlantViewModel vm;
  final ColorScheme scheme;
  final Color onSurface;

  Future<void> _toggle(BuildContext context) async {
    plant.remindersEnabled = !plant.remindersEnabled;
    await vm.updatePlant(plant, context);
    if (context.mounted) {
      final loc = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            plant.remindersEnabled
                ? loc.snackRemindersOn(plant.name)
                : loc.snackRemindersOff(plant.name),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final bool on = plant.remindersEnabled;
    return GlassContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (on ? scheme.primary : Colors.grey).withValues(
                alpha: 0.12,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              on
                  ? Icons.notifications_active_outlined
                  : Icons.notifications_off_outlined,
              color: on ? scheme.primary : Colors.grey,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loc.pushReminders,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  on ? loc.notificationsActive : loc.tapToEnableNotifications,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Switch(
            value: on,
            activeThumbColor: scheme.primary,
            onChanged: (_) => _toggle(context),
          ),
        ],
      ),
    );
  }
}
