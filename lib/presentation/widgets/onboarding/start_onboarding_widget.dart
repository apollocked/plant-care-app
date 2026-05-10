import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
          SizedBox(
            width: double.infinity,
            child: Lottie.asset('assets/animations/byscle.json'),
          ),
          myGlassCard(
            context,
            child: Column(
              children: [
                Text(
                  'Enjoy the benefits of a modern approach to keeping your plants alive and thriving with Plant Care.',
                  textAlign: TextAlign.start,
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
