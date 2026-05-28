import 'package:flutter/material.dart';

class CareStatusHeader extends StatelessWidget {
  const CareStatusHeader({
    super.key,
    required this.icon,
    required this.color,
    required this.activeColor,
    required this.title,
    required this.statusLabel,
    required this.onSurface,
  });

  final IconData icon;
  final Color color;
  final Color activeColor;
  final String title;
  final String statusLabel;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: onSurface,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(child: StatusBadge(label: statusLabel, color: activeColor)),
      ],
    );
  }
}

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ),
    );
  }
}

class CareProgressBar extends StatelessWidget {
  const CareProgressBar({
    super.key,
    required this.activeColor,
    required this.value,
  });

  final Color activeColor;
  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: activeColor.withValues(alpha: 0.1),
        valueColor: AlwaysStoppedAnimation<Color>(activeColor),
        minHeight: 6,
      ),
    );
  }
}

class CareStatusMeta extends StatelessWidget {
  const CareStatusMeta({
    super.key,
    required this.color,
    required this.lastActionLabel,
    required this.intervalLabel,
    required this.onSurface,
  });

  final Color color;
  final String lastActionLabel;
  final String intervalLabel;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.history_rounded,
          size: 13,
          color: onSurface.withValues(alpha: 0.4),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 3,
          child: Text(
            lastActionLabel,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 2,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              intervalLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color.withValues(alpha: 0.85),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
