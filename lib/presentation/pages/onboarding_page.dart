import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive
import 'package:mock_plant_care_app/presentation/widgets/onboarding/info_onboarding_widget.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/start_onboarding_widget.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/wellcome_onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool isLastPage = false;
  final PageController pageController = PageController();

  final List<Widget> pages = [
    const WellcomeWidget(),
    const InfoOnboardingWidget(),
    const StartOnboardingWidget(),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 650),
              curve: Curves.fastEaseInToSlowEaseOut,
              tween: Tween(begin: 1.7, end: 0.0),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return AnimatedAlign(
                  duration: Duration(milliseconds: 750),
                  alignment: isLastPage
                      ? Alignment(0, -0.6)
                      : Alignment(0.0 - value, -0.9),

                  child: Text(
                    "Wellcome",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),

            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = (index == pages.length - 1);
                });
              },
              children: pages,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SKIP BUTTON
                  isLastPage
                      ? SizedBox(width: 60)
                      : TextButton(
                          onPressed: () =>
                              pageController.jumpToPage(pages.length - 1),
                          child: const Text('Skip'),
                        ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: pages.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (isLastPage) {
                        // var box = Hive.box('settings');
                        // await box.put('isFirstTime', false);
                        if (mounted) {}
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(isLastPage ? 'Done' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
