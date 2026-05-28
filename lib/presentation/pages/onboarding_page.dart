import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/logic/theme_viewmodel.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/home_header.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/info_onboarding_widget.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/start_onboarding_widget.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/wellcome_onboarding_widget.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/onboarding_bottom_controls.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/onboarding_get_started_button.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _controller;
  bool isLastPage = false;
  Timer? _timer;

  final List<Widget> pages = [
    const WellcomeWidget(),
    const InfoOnboardingWidget(),
    const StartOnboardingWidget(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (_controller.hasClients) {
        int nextPage = _controller.page!.round() + 1;
        if (nextPage < pages.length) {
          _controller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 1250),
            curve: Curves.easeOutBack,
          );
        } else {
          _timer?.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeViewModel themeVm = context.watch<ThemeViewModel>();
    final bool isDark = themeVm.isDarkMode;
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HomeAppBar(
        isDark: isDark,
        onSurface: theme.colorScheme.onSurface,
      ),
      body: Stack(
        children: [
          _buildGradient(context, theme),
          _buildDecorativeCircle(theme),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 4000),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 190 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Text(
                loc.wellcome,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary,
                  letterSpacing: -1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 15),
          PageView.builder(
            itemCount: pages.length,
            itemBuilder: (_, i) => pages[i],
            controller: _controller,
            onPageChanged: (i) => setState(() => isLastPage = i == 2),
          ),
          if (isLastPage) OnboardingGetStartedButton(theme: theme),
          OnboardingBottomControls(
            isLastPage: isLastPage,
            controller: _controller,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildGradient(BuildContext context, ThemeData theme) {
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

  Widget _buildDecorativeCircle(ThemeData theme) {
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
}
