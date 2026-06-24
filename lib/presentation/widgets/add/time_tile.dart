import 'package:flutter/material.dart';

class TimeTile extends StatelessWidget {
  const TimeTile({
    super.key,
    required this.label,
    required this.time,
    required this.onTap,
    required this.icon,
    required this.color,
    required this.onSurface,
  });

  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: onSurface.withValues(alpha: 0.1)),
          color: isDark
              ? Colors.white.withValues(alpha: 0.03)
              : Colors.black.withValues(alpha: 0.02),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 12),
            Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                time.format(context),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            const SizedBox(width: 4),
            Icon(
              Icons.edit_calendar_rounded,
              size: 14,
              color: onSurface.withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }
}
