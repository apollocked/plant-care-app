import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    super.key,
    required this.child,
    this.stops = const [0.0, 0.3, 1.0],
    this.primaryOpacity = 0.15,
  });

  final Widget child;
  final List<double> stops;
  final double primaryOpacity;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final double alpha = isDark ? primaryOpacity + 0.05 : primaryOpacity - 0.03;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: stops,
          colors: [
            scheme.primary.withValues(alpha: alpha.clamp(0.0, 1.0)),
            scheme.primary.withValues(alpha: (alpha * 0.4).clamp(0.0, 1.0)),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
