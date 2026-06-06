import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'stat_card.dart';
import 'stats_details_overlay.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key, required this.plantVm});

  final PlantViewModel plantVm;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final int total = plantVm.plants.length;
    final int needWater = plantVm.plants.where((p) => p.needsWaterNow).length;
    final int needFood = plantVm.plants.where((p) => p.needsFoodNow).length;
    final int happy =
        total -
        plantVm.plants.where((p) => p.needsWaterNow || p.needsFoodNow).length;
    final Color primary = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        Expanded(
          child: StatCard(
            value: '$total',
            label: loc.statTotal,
            icon: Icons.local_florist_outlined,
            color: primary,
            onLongPress: () =>
                _showTotalStats(context, total, needWater, needFood, happy),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            value: '$happy',
            label: loc.statHealthy,
            icon: Icons.favorite_outline_rounded,
            color: Colors.green,
            onLongPress: () => _showHealthyStats(context, happy, total),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            value: '$needWater',
            label: loc.statWater,
            icon: Icons.water_drop_outlined,
            color: Colors.blue,
            onLongPress: () => _showWaterStats(context, needWater, total),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            value: '$needFood',
            label: loc.statFeed,
            icon: Icons.grass_outlined,
            color: Colors.orange,
            onLongPress: () => _showFoodStats(context, needFood, total),
          ),
        ),
      ],
    );
  }

  void _showTotalStats(
    BuildContext context,
    int total,
    int needWater,
    int needFood,
    int happy,
  ) {
    showDialog(
      context: context,
      builder: (_) => StatsDetailsOverlay(
        title: AppLocalizations.of(context)!.statTotal,
        value: '$total',
        description: 'Your plant collection',
        icon: Icons.local_florist_outlined,
        color: Theme.of(context).colorScheme.primary,
        details: [
          '$happy healthy plants',
          '$needWater need water',
          '$needFood need food',
        ],
      ),
    );
  }

  void _showHealthyStats(BuildContext context, int happy, int total) {
    final percentage = total > 0
        ? ((happy / total) * 100).toStringAsFixed(0)
        : '0';
    showDialog(
      context: context,
      builder: (_) => StatsDetailsOverlay(
        title: AppLocalizations.of(context)!.statHealthy,
        value: '$happy',
        description: '$percentage% of your plants are thriving',
        icon: Icons.favorite_outline_rounded,
        color: Colors.green,
        details: ['Great job! Keep up the care!'],
      ),
    );
  }

  void _showWaterStats(BuildContext context, int needWater, int total) {
    final percentage = total > 0
        ? ((needWater / total) * 100).toStringAsFixed(0)
        : '0';
    showDialog(
      context: context,
      builder: (_) => StatsDetailsOverlay(
        title: AppLocalizations.of(context)!.statWater,
        value: '$needWater',
        description: '$percentage% of plants need water',
        icon: Icons.water_drop_outlined,
        color: Colors.blue,
        details: ['Tap on plants to water them', 'Consider watering now'],
      ),
    );
  }

  void _showFoodStats(BuildContext context, int needFood, int total) {
    final percentage = total > 0
        ? ((needFood / total) * 100).toStringAsFixed(0)
        : '0';
    showDialog(
      context: context,
      builder: (_) => StatsDetailsOverlay(
        title: AppLocalizations.of(context)!.statFeed,
        value: '$needFood',
        description: '$percentage% of plants need fertilizer',
        icon: Icons.grass_outlined,
        color: Colors.orange,
        details: [
          'Feed plants that are weakened',
          'Follow feeding instructions per plant',
        ],
      ),
    );
  }
}
