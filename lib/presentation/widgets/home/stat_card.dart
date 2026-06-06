import 'package:flutter/material.dart';
import 'package:plant_care_app/presentation/widgets/settings/glass_container.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
    this.onLongPress,
  });

  final String value;
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    return GestureDetector(
      onLongPress: onLongPress,
      child: GlassContainer(
        borderRadius: 16,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: isDark ? 0.2 : 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 16, color: color),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: onSurface,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
