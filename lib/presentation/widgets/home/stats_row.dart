import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'stat_card.dart';
import 'stat_card_data.dart';
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

    String percentageOf(int count) => total > 0
        ? ((count / total) * 100).toStringAsFixed(0)
        : '0';

    final cards = [
      StatCardData(
        value: '$total',
        label: loc.statTotal,
        icon: Icons.local_florist_outlined,
        color: primary,
        description: loc.statTotalDesc,
        details: [
          loc.statTotalDetailHealthy(happy),
          loc.statTotalDetailWater(needWater),
          loc.statTotalDetailFood(needFood),
        ],
      ),
      StatCardData(
        value: '$happy',
        label: loc.statHealthy,
        icon: Icons.favorite_outline_rounded,
        color: Colors.green,
        description: loc.statHealthyDesc(percentageOf(happy)),
        details: [loc.statHealthyDetail],
      ),
      StatCardData(
        value: '$needWater',
        label: loc.statWater,
        icon: Icons.water_drop_outlined,
        color: Colors.blue,
        description: loc.statWaterDesc(percentageOf(needWater)),
        details: [loc.statWaterDetailTap, loc.statWaterDetailConsider],
      ),
      StatCardData(
        value: '$needFood',
        label: loc.statFeed,
        icon: Icons.grass_outlined,
        color: Colors.orange,
        description: loc.statFeedDesc(percentageOf(needFood)),
        details: [loc.statFeedDetailWeakened, loc.statFeedDetailFollow],
      ),
    ];

    return Row(
      children: [
        for (int i = 0; i < cards.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Expanded(
            child: StatCard(
              value: cards[i].value,
              label: cards[i].label,
              icon: cards[i].icon,
              color: cards[i].color,
              onLongPress: () => _showStatsDetails(context, cards[i]),
            ),
          ),
        ],
      ],
    );
  }

  void _showStatsDetails(BuildContext context, StatCardData card) {
    showDialog(
      context: context,
      builder: (_) => StatsDetailsOverlay(
        title: card.label,
        value: card.value,
        description: card.description,
        icon: card.icon,
        color: card.color,
        details: card.details,
      ),
    );
  }
}
