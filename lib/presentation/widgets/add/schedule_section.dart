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
                      color: AppColors.formWaterIcon,
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
                      color: AppColors.formFeedIcon,
                      size: 20,
                    ),
                  ),
                  validator: (v) => validatePositiveInt(v, loc),
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
