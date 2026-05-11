import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
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
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          SizedBox(
            height: 250,
            child: Lottie.asset(
              'assets/animations/plant.json',
              controller: controller,
              onLoaded: (composition) {
                controller.duration = const Duration(milliseconds: 1250);
                controller.repeat(reverse: true, min: 0.05, max: 0.25);
              },
            ),
          ),
          const Spacer(flex: 1),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: myGlassCard(
                    context,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loc.onboardingInfoTitle1,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const Divider(),
                        Text(
                          loc.onboardingInfoBody1,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: myGlassCard(
                    context,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loc.onboardingInfoTitle2,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const Divider(),
                        Text(
                          loc.onboardingInfoBody2,
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
