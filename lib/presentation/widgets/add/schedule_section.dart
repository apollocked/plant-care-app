import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/presentation/widgets/glass_container.dart';
import 'form_helpers.dart';

class CareScheduleSection extends StatelessWidget {
  const CareScheduleSection({
    super.key,
    required this.waterDaysCtrl,
    required this.feedDaysCtrl,
    required this.onSurface,
  });

  final TextEditingController waterDaysCtrl;
  final TextEditingController feedDaysCtrl;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return GlassContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormSectionHeader(
            icon: '📅',
            label: loc.sectionCareSchedule,
            onSurface: onSurface,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: waterDaysCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: TextStyle(color: onSurface),
                  decoration: InputDecoration(
                    labelText: loc.labelWaterEvery,
                    suffixText: loc.suffixDays,
                    prefixIcon: Icon(
                      Icons.water_drop_outlined,
                      color: Colors.blue.shade400,
                      size: 20,
                    ),
                  ),
                  validator: (v) => validatePositiveInt(v, loc),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: feedDaysCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: TextStyle(color: onSurface),
                  decoration: InputDecoration(
                    labelText: loc.labelFeedEvery,
                    suffixText: loc.suffixDays,
                    prefixIcon: Icon(
                      Icons.grass_outlined,
                      color: Colors.green.shade600,
                      size: 20,
                    ),
                  ),
                  validator: (v) => validatePositiveInt(v, loc),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _ScheduleTips(onSurface: onSurface, scheme: scheme),
        ],
      ),
    );
  }
}

class _ScheduleTips extends StatelessWidget {
  const _ScheduleTips({required this.onSurface, required this.scheme});
  final Color onSurface;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                size: 14,
                color: scheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                loc.commonCareTips,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: scheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _TipRow(icon: '💧', text: loc.tipWater, onSurface: onSurface),
          const SizedBox(height: 4),
          _TipRow(icon: '🧪', text: loc.tipFeed, onSurface: onSurface),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  const _TipRow({
    required this.icon,
    required this.text,
    required this.onSurface,
  });
  final String icon;
  final String text;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 10)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: onSurface.withValues(alpha: 0.7),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
