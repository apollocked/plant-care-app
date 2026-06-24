import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBottomControls extends StatelessWidget {
  const OnboardingBottomControls({
    super.key,
    required this.isLastPage,
    required this.controller,
    required this.theme,
  });
  final bool isLastPage;
  final PageController controller;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: isLastPage
                ? const SizedBox()
                : TextButton(
                    onPressed: () => controller.animateToPage(
                      2,
                      curve: Curves.easeInOutCubic,
                      duration: const Duration(milliseconds: 200),
                    ),
                    child: Text(
                      loc.skip,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: theme.colorScheme.primary,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
          SizedBox(
            width: 70,
            height: 55,
            child: isLastPage
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      loc.next,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
