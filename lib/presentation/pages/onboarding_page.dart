import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mock_plant_care_app/logic/theme_viewmodel.dart';
import 'package:mock_plant_care_app/presentation/pages/home_page.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/home_header.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/info_onboarding_widget.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/start_onboarding_widget.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/wellcome_onboarding_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool isLastPage = false;
  List<Widget> pages = [
    WellcomeWidget(),
    InfoOnboardingWidget(),
    StartOnboardingWidget(),
  ];

  final PageController _controller = PageController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeViewModel themeVm = context.watch<ThemeViewModel>();
    final bool isDark = themeVm.isDarkMode;

    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HomeAppBar(
        isDark: isDark,
        onToggleTheme: themeVm.toggleTheme,
        onSurface: theme.colorScheme.onSurface,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const <double>[0.0, 0.4, 1.0],
                colors: <Color>[
                  theme.colorScheme.primary.withValues(alpha: 0.25),
                  theme.colorScheme.primary.withValues(alpha: 0.08),
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary.withOpacity(0.08),
              ),
            ),
          ),
          PageView.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) => pages[index],
            controller: _controller,
            onPageChanged: (i) => setState(() => isLastPage = i == 2),
          ),
          isLastPage
              ? Align(
                  key: Key('button'),
                  alignment: Alignment(0, 0.6),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Hive.box('settings').put('isFirstTime', false);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Center(child: const Text('Get Started')),
                    ),
                  ),
                )
              : const SizedBox(),
          Positioned(
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
                          onPressed: () => _controller.animateToPage(
                            pages.length - 1,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 200),
                          ),
                          child: Text(
                            'Skip',
                            style: TextStyle(color: theme.colorScheme.outline),
                          ),
                        ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
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
                          onPressed: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          ),
                          child: Text(
                            key: Key('button'),
                            'Next',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
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
