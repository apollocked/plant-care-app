import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({
    super.key,
    required this.isDark,
    required this.onSurface,
    this.onTap,
  });

  final bool isDark;
  final Color onSurface;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.06),
        ),
        child: Icon(
          Icons.settings_outlined,
          size: 20,
          color: onSurface.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
