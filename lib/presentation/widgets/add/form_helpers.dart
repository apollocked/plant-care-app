import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';

class FormSectionHeader extends StatelessWidget {
  const FormSectionHeader({
    super.key,
    required this.icon,
    required this.label,
    required this.onSurface,
  });

  final String icon;
  final String label;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

String? validatePositiveInt(String? v, AppLocalizations loc) {
  if (v == null || v.isEmpty) return loc.validatorRequired;
  final int? val = int.tryParse(v);
  if (val == null || val <= 0) return loc.validatorMustBePositive;
  return null;
}
