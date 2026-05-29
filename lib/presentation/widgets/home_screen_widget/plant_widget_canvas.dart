import 'package:flutter/material.dart';

class PlantWidgetCanvas extends StatelessWidget {
  const PlantWidgetCanvas({
    super.key,
    required this.total,
    required this.happy,
    required this.needWater,
    required this.needFood,
    required this.locale,
    required this.textMyPlants,
    required this.textTotal,
    required this.textHealthy,
    required this.textWater,
    required this.textFeed,
  });

  final int total;
  final int happy;
  final int needWater;
  final int needFood;
  final Locale locale;
  final String textMyPlants;
  final String textTotal;
  final String textHealthy;
  final String textWater;
  final String textFeed;

  @override
  Widget build(BuildContext context) {
    final isRTL = ['ar', 'ku', 'fa'].contains(locale.languageCode);
    final textDirection = isRTL ? TextDirection.rtl : TextDirection.ltr;
    final theme = Theme.of(context);
    final bgColor = theme.brightness == Brightness.dark
        ? const Color(0xFF0B1A16)
        : const Color(0xFFF7FAF8);
    final textColor = theme.colorScheme.onSurface;

    return MediaQuery(
      data: const MediaQueryData(size: Size(360, 180)),
      child: Directionality(
        textDirection: textDirection,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 360,
            height: 180,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHeader(context, textColor),
                _buildStatsRow(textColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.local_florist,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              textMyPlants,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              textTotal,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              total.toString(),
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsRow(Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem(happy, textHealthy, Colors.green, textColor),
        _buildStatItem(needWater, textWater, Colors.blue, textColor),
        _buildStatItem(needFood, textFeed, Colors.orange, textColor),
      ],
    );
  }

  Widget _buildStatItem(
    int value,
    String label,
    Color iconColor,
    Color textColor,
  ) {
    return Column(
      children: [
        Icon(Icons.circle, color: iconColor, size: 12),
        Text(
          "$value",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(
            color: textColor.withValues(alpha: 0.6),
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
