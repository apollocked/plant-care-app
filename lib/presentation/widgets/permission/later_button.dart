import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';

class LaterButton extends StatelessWidget {
  const LaterButton({
    super.key,
    required this.subtextColor,
    required this.isDark,
  });
  final Color subtextColor;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: subtextColor.withValues(alpha: 0.25)),
          ),
        ),
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(
          loc.maybeLater,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: subtextColor,
          ),
        ),
      ),
    );
  }
}
