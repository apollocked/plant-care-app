import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/glass_card.dart';

class InfoOnboardingWidget extends StatefulWidget {
  const InfoOnboardingWidget({super.key});

  @override
  State<InfoOnboardingWidget> createState() => _InfoOnboardingWidgetState();
}

class _InfoOnboardingWidgetState extends State<InfoOnboardingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: Lottie.asset(
            'assets/animations/plant.json',
            controller: controller,
            onLoaded: (composition) {
              controller.duration = const Duration(milliseconds: 1500);
              controller.repeat(reverse: true, min: 0, max: 0.25);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: myGlassCard(
            context,
            child: Column(
              children: [
                Text(
                  'Never Miss a Drop',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Set custom reminders for watering, fertilizing, and repotting. Your plants will thank you.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
