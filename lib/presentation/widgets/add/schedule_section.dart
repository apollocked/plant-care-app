import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/core/theme/app_colors.dart';
import 'package:plant_care_app/presentation/widgets/settings/glass_container.dart';
import 'form_helpers.dart';
import 'schedule_tips.dart';

class CareScheduleSection extends StatelessWidget {
  const CareScheduleSection({
    super.key,
    required this.waterDaysCtrl,
    required this.feedDaysCtrl,
    required this.onSurface,
    this.waterUnitIsWeeks = false,
    this.feedUnitIsWeeks = false,
    this.onWaterUnitChanged,
    this.onFeedUnitChanged,
  });

  final TextEditingController waterDaysCtrl;
  final TextEditingController feedDaysCtrl;
  final Color onSurface;
  final bool waterUnitIsWeeks;
  final bool feedUnitIsWeeks;
  final ValueChanged<bool>? onWaterUnitChanged;
  final ValueChanged<bool>? onFeedUnitChanged;

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
                child: _IntervalField(
                  controller: waterDaysCtrl,
                  label: loc.labelWaterEvery,
                  prefixIcon: Icons.water_drop_outlined,
                  prefixColor: AppColors.formWaterIcon,
                  unitIsWeeks: waterUnitIsWeeks,
                  onUnitChanged: onWaterUnitChanged,
                  suffixDays: loc.suffixDays,
                  suffixWeeks: loc.suffixWeeks,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _IntervalField(
                  controller: feedDaysCtrl,
                  label: loc.labelFeedEvery,
                  prefixIcon: Icons.grass_outlined,
                  prefixColor: AppColors.formFeedIcon,
                  unitIsWeeks: feedUnitIsWeeks,
                  onUnitChanged: onFeedUnitChanged,
                  suffixDays: loc.suffixDays,
                  suffixWeeks: loc.suffixWeeks,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ScheduleTips(onSurface: onSurface, scheme: scheme),
        ],
      ),
    );
  }
}

class _IntervalField extends StatelessWidget {
  const _IntervalField({
    required this.controller,
    required this.label,
    required this.prefixIcon,
    required this.prefixColor,
    required this.unitIsWeeks,
    required this.onUnitChanged,
    required this.suffixDays,
    required this.suffixWeeks,
  });

  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;
  final Color prefixColor;
  final bool unitIsWeeks;
  final ValueChanged<bool>? onUnitChanged;
  final String suffixDays;
  final String suffixWeeks;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final primary = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          decoration: InputDecoration(
            labelText: label,
            suffixText: unitIsWeeks ? suffixWeeks : suffixDays,
            prefixIcon: Icon(prefixIcon, color: prefixColor, size: 20),
          ),
          validator: (v) => validatePositiveInt(v, loc),
        ),
        const SizedBox(height: 6),
        if (onUnitChanged != null)
          Center(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => onUnitChanged!(!unitIsWeeks),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primary.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        unitIsWeeks ? loc.switchToDays : loc.switchToWeeks,
                        style: textTheme.labelSmall?.copyWith(
                          color: primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.swap_horiz_rounded, size: 14, color: primary),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
