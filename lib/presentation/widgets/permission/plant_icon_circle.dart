import 'package:flutter/material.dart';

class PlantIconCircle extends StatelessWidget {
  const PlantIconCircle({super.key, required this.scheme});
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            scheme.primary.withValues(alpha: 0.15),
            scheme.primary.withValues(alpha: 0.04),
          ],
        ),
        border: Border.all(
          color: scheme.primary.withValues(alpha: 0.25),
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Image.asset('assets/icons/plant_icon.png', fit: BoxFit.contain),
    );
  }
}
