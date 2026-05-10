import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/glass_card.dart';

class StartOnboardingWidget extends StatelessWidget {
  const StartOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shutter_speed_rounded,
            size: 80,
            color: theme.colorScheme.secondary,
          ),
          const SizedBox(height: 30),
          myGlassCard(
            context,
            child: Column(
              children: [
                Text(
                  'Fast. Secure. Local.',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Your data stays on your device. High-performance tracking powered by Hive & MVVM.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(),
                ),
                Text(
                  'Ready to start your journey?',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
