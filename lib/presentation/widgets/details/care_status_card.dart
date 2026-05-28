import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/care_status_components.dart';
import 'package:mock_plant_care_app/presentation/widgets/glass_container.dart';

class CareStatusCard extends StatelessWidget {
  const CareStatusCard({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.okLabel,
    required this.urgentLabel,
    required this.isUrgent,
    required this.lastActionLabel,
    required this.lastActionAt,
    required this.nextDueAt,
    required this.nextDueLabel,
    required this.intervalLabel,
    required this.onSurface,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String okLabel;
  final String urgentLabel;
  final bool isUrgent;
  final String lastActionLabel;
  final DateTime lastActionAt;
  final DateTime nextDueAt;
  final String nextDueLabel;
  final String intervalLabel;
  final Color onSurface;

  double _progressValue() {
    final int total = nextDueAt.difference(lastActionAt).inMilliseconds;
    if (total <= 0) {
      return isUrgent ? 0.0 : 1.0;
    }

    final int elapsed = DateTime.now().difference(lastActionAt).inMilliseconds;
    final double remaining = 1 - (elapsed / total);
    return remaining.clamp(0.0, 1.0).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final Color active = isUrgent ? color : Colors.green;

    return GlassContainer(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CareStatusHeader(
            icon: icon,
            color: color,
            activeColor: active,
            title: title,
            statusLabel: isUrgent ? urgentLabel : okLabel,
            onSurface: onSurface,
          ),
          const SizedBox(height: 14),
          CareProgressBar(activeColor: active, value: _progressValue()),
          const SizedBox(height: 12),
          CareStatusMeta(
            color: color,
            lastActionLabel: lastActionLabel,
            intervalLabel: intervalLabel,
            onSurface: onSurface,
          ),
          const SizedBox(height: 4),
          Text(
            nextDueLabel,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isUrgent ? FontWeight.w600 : FontWeight.w400,
              color: isUrgent ? color : onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
