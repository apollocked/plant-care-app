import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';

class NotifDialogContent extends StatelessWidget {
  const NotifDialogContent({
    super.key,
    required this.textColor,
    required this.subtextColor,
  });
  final Color textColor;
  final Color subtextColor;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          loc.notifDialogTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: textColor,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          loc.notifDialogBody,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: subtextColor, height: 1.5),
        ),
      ],
    );
  }
}
