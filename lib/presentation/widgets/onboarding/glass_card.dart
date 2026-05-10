import 'dart:ui';

import 'package:flutter/material.dart';

Widget myGlassCard(BuildContext context, {required Widget child}) {
  final theme = Theme.of(context);
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: theme.colorScheme.onSurface.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: child,
      ),
    ),
  );
}
