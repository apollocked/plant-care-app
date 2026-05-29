import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/presentation/widgets/settings/glass_container.dart';
import 'form_helpers.dart';

class PlantIdentitySection extends StatelessWidget {
  const PlantIdentitySection({
    super.key,
    required this.nameCtrl,
    required this.speciesCtrl,
    required this.onSurface,
  });

  final TextEditingController nameCtrl;
  final TextEditingController speciesCtrl;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return GlassContainer(
      borderRadius: 20,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormSectionHeader(
            icon: '🌱',
            label: loc.sectionPlantIdentity,
            onSurface: onSurface,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: nameCtrl,
            style: TextStyle(color: onSurface),
            decoration: InputDecoration(
              labelText: loc.labelPlantName,
              hintText: loc.hintPlantName,
              prefixIcon: const Icon(Icons.badge_outlined, size: 20),
            ),
            validator: (String? v) =>
                (v == null || v.trim().isEmpty) ? loc.validatorEnterName : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: speciesCtrl,
            style: TextStyle(color: onSurface),
            decoration: InputDecoration(
              labelText: loc.labelSpecies,
              hintText: loc.hintSpecies,
              prefixIcon: const Icon(Icons.eco_outlined, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
