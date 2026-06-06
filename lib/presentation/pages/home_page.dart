import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/core/notifications/notification_controller.dart';
import 'package:plant_care_app/presentation/pages/plant_details_page.dart';
import 'package:plant_care_app/presentation/widgets/home/add_plant_fab.dart';
import 'package:plant_care_app/presentation/widgets/home/empty_state.dart';
import 'package:plant_care_app/presentation/widgets/home/hero_banner.dart';
import 'package:plant_care_app/presentation/widgets/home/home_header.dart';
import 'package:plant_care_app/presentation/widgets/home/plant_card.dart';
import 'package:plant_care_app/presentation/widgets/home/stats_row.dart';
import 'package:plant_care_app/presentation/widgets/home/urgent_banner.dart';
import 'package:plant_care_app/presentation/widgets/home/section_header.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'package:plant_care_app/logic/theme_viewmodel.dart';
import 'package:plant_care_app/data/services/storage_service.dart';
import 'package:plant_care_app/presentation/pages/settings_page.dart';
import 'package:plant_care_app/presentation/widgets/onboarding/build_showcase.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.storageService});
  final StorageService storageService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _fabAnim;
  late final ShowcaseView _showcaseView;
  late ScrollController _scrollController;
  bool _highlightUrgent = false;

  final GlobalKey _settingsKey = GlobalKey();
  final GlobalKey _bannerKey = GlobalKey();
  final GlobalKey _statsKey = GlobalKey();
  final GlobalKey _sectionHeaderKey = GlobalKey();
  final GlobalKey _emptyStateKey = GlobalKey();
  final GlobalKey _fabKey = GlobalKey();
  final GlobalKey _urgentPlantKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _showcaseView = ShowcaseView.register(onFinish: () {});
    _scrollController = ScrollController();
    _fabAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTourOrRequestPermission();
    });

    AwesomeNotifications().setListeners(
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  @override
  void dispose() {
    _showcaseView.unregister();
    _fabAnim.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _startTourOrRequestPermission() {
    if (!mounted) return;
    if (!widget.storageService.hasSeenHomeTour()) {
      _startShowcaseTour();
      widget.storageService.setSeenHomeTour();
    }
  }

  void _startShowcaseTour() {
    if (!mounted) return;
    final PlantViewModel plantVm = context.read<PlantViewModel>();

    _showcaseView.startShowCase([
      _settingsKey,
      _bannerKey,
      _statsKey,
      _sectionHeaderKey,
      if (plantVm.plants.isEmpty) _emptyStateKey else _urgentPlantKey,
      _fabKey,
    ]);
  }

  void _scrollToUrgentPlants() {
    if (!mounted) return;
    setState(() => _highlightUrgent = true);

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent * 0.6,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _highlightUrgent = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final PlantViewModel plantVm = context.watch<PlantViewModel>();

    final ThemeViewModel themeVm = context.watch<ThemeViewModel>();
    final bool isDark = themeVm.isDarkMode;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;
    final int plantCount = plantVm.plants.length;

    final int urgent = plantVm.plants
        .where((p) => p.needsWaterNow || p.needsFoodNow)
        .length;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: HomeAppBar(
        isDark: isDark,
        onSurface: scheme.onSurface,
        showcaseKey: _settingsKey,
        showcaseTitle: loc.tourSettingsTitle,
        showcaseDesc: loc.tourSettingsDesc,
        onSettingsTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingsPage()),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.45, 1.0],
            colors: [
              scheme.primary.withValues(alpha: isDark ? 0.25 : 0.18),
              scheme.primary.withValues(alpha: isDark ? 0.08 : 0.05),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: buildShowcase(
                    key: _bannerKey,
                    title: loc.tourBannerTitle,
                    description: loc.tourBannerDesc,
                    isDark: isDark,
                    targetBorderRadius: BorderRadius.circular(24),
                    child: HeroBanner(
                      urgentCount: urgent,
                      plantCount: plantCount,
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  child: buildShowcase(
                    key: _statsKey,
                    title: loc.tourStatsTitle,
                    description: loc.tourStatsDesc,
                    isDark: isDark,
                    targetBorderRadius: BorderRadius.circular(16),
                    child: StatsRow(plantVm: plantVm),
                  ),
                ),
              ),

              if (urgent > 0)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                    child: InkWell(
                      child: UrgentBanner(urgentCount: urgent),
                      onTap: () => _scrollToUrgentPlants(),
                    ),
                  ),
                ),

              SliverToBoxAdapter(
                child: buildShowcase(
                  key: _sectionHeaderKey,
                  title: loc.tourSectionTitle,
                  description: loc.tourSectionDesc,
                  isDark: isDark,
                  child: SectionHeader(
                    count: plantVm.plants.length,
                    onSurface: scheme.onSurface,
                    scheme: scheme,
                  ),
                ),
              ),

              if (plantVm.plants.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: buildShowcase(
                    key: _emptyStateKey,
                    title: loc.tourEmptyTitle,
                    description: loc.tourEmptyDesc,
                    isDark: isDark,
                    child: const EmptyPlantState(),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                  sliver: SliverList.separated(
                    key: _urgentPlantKey,
                    itemCount: plantVm.plants.length,
                    itemBuilder: (BuildContext ctx, int i) {
                      final PlantModel p = plantVm.plants[i];
                      final bool isUrgent = p.needsWaterNow || p.needsFoodNow;
                      final bool shouldHighlight = _highlightUrgent && isUrgent;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: shouldHighlight
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: scheme.error.withValues(alpha: 0.4),
                                    blurRadius: 12,
                                    spreadRadius: 2,
                                  ),
                                ],
                              )
                            : null,
                        child: PlantCard(
                          plant: p,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PlantDetailsPage(plantId: p.id),
                            ),
                          ),
                          onWaterTap: () => context
                              .read<PlantViewModel>()
                              .markPlantWatered(p.id, context),
                          onFeedTap: () => context
                              .read<PlantViewModel>()
                              .markPlantFed(p.id, context),
                        ),
                      );
                    },
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                  ),
                ),
            ],
          ),
        ),
      ),

      floatingActionButton: buildShowcase(
        key: _fabKey,
        title: loc.tourFabTitle,
        description: loc.tourFabDesc,
        isDark: isDark,
        targetBorderRadius: BorderRadius.circular(28),
        child: AddPlantFAB(animation: _fabAnim, scheme: scheme),
      ),
    );
  }
}
