import 'package:flutter/material.dart';

Widget onBoaerdingGradient(BuildContext context, ThemeData theme) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const <double>[0.0, 0.4, 1.0],
        colors: [
          theme.colorScheme.primary.withValues(alpha: 0.25),
          theme.colorScheme.primary.withValues(alpha: 0.08),
          Theme.of(context).scaffoldBackgroundColor,
        ],
      ),
    ),
  );
}

Widget onboardingDecorativeCircle(ThemeData theme) {
  return Positioned(
    top: -100,
    right: -50,
    child: Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.primary.withValues(alpha: 0.08),
      ),
    ),
  );
}
