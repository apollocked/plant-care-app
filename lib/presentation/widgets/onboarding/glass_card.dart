import 'dart:ui';

import 'package:flutter/material.dart';

Widget myGlassCard(BuildContext context, {required Widget child}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: child,
      ),
    ),
  );
}
