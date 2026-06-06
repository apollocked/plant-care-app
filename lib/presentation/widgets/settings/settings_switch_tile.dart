import 'package:flutter/material.dart';

class SettingsSwitchTile extends StatelessWidget {
  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return SwitchListTile(
      secondary: Icon(icon, color: scheme.primary, size: 22),
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeThumbColor: scheme.primary,
      inactiveThumbColor: Theme.of(context).disabledColor,
      inactiveTrackColor: Theme.of(
        context,
      ).disabledColor.withValues(alpha: 0.3),
    );
  }
}
