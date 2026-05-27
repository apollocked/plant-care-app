import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/services/storage_service.dart';
import 'package:mock_plant_care_app/presentation/pages/home_page.dart';
import 'package:showcaseview/showcaseview.dart';

class OnboardingGetStartedButton extends StatelessWidget {
  const OnboardingGetStartedButton({super.key, required this.theme});
  final ThemeData theme;

  void _completeOnboarding(BuildContext context) async {
    await StorageService().setNotFirstTime();

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ShowCaseWidget(
            builder: (context) => HomePage(storageService: StorageService()),
          ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Align(
      key: const Key('button'),
      alignment: const Alignment(0, 0.6),
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ElevatedButton(
          onPressed: () => _completeOnboarding(context),
          child: Center(child: Text(loc.getStarted)),
        ),
      ),
    );
  }
}
