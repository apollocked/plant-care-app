import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';
import 'stat_card.dart';

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
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            value: '$happy',
            label: loc.statHealthy,
            icon: Icons.favorite_outline_rounded,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            value: '$needWater',
            label: loc.statWater,
            icon: Icons.water_drop_outlined,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            value: '$needFood',
            label: loc.statFeed,
            icon: Icons.grass_outlined,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
