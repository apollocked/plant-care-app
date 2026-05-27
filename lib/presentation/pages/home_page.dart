import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/core/notifications/notification_controller.dart';
import 'package:mock_plant_care_app/presentation/pages/plant_details_page.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/add_plant_fab.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/empty_state.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/hero_banner.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/home_header.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/plant_card.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/stats_row.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/urgent_banner.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/section_header.dart';
import 'package:mock_plant_care_app/presentation/widgets/notfication_handler.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';
import 'package:mock_plant_care_app/logic/theme_viewmodel.dart';
import 'package:mock_plant_care_app/data/services/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

const Color _kTooltipBg = Color(0xFF1B4332); // deep botanical green
const Color _kTooltipBgDark = Color(0xFF0D2B1F);
const Color _kOverlayColor = Color(0xFF000000);
const double _kOverlayOpacity = 0.78;

Widget _buildShowcase({
  required GlobalKey key,
  required String title,
  required String description,
  required Widget child,
  required bool isDark,
  BorderRadius? targetBorderRadius,
  ShapeBorder? targetShapeBorder,
}) {
  final Color bg = isDark ? _kTooltipBgDark : _kTooltipBg;

  return Showcase(
    key: key,

    title: title,
    description: description,

    tooltipBackgroundColor: bg,
    tooltipBorderRadius: BorderRadius.circular(20),
    textColor: Colors.white,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.2,
    ),
    descTextStyle: TextStyle(
      color: Colors.white.withValues(alpha: 0.82),
      fontSize: 13,
      height: 1.45,
      fontWeight: FontWeight.w400,
    ),

    targetBorderRadius: targetBorderRadius ?? BorderRadius.circular(16),
    targetShapeBorder: targetShapeBorder ?? const RoundedRectangleBorder(),

    overlayColor: _kOverlayColor,
    overlayOpacity: _kOverlayOpacity,

    movingAnimationDuration: const Duration(milliseconds: 550),
    child: child,
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.storageService});
  final StorageService storageService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _fabAnim;

  // GlobalKeys for the 5 showcase sections.
  final GlobalKey _bannerKey = GlobalKey();
  final GlobalKey _statsKey = GlobalKey();
  final GlobalKey _sectionHeaderKey = GlobalKey();
  final GlobalKey _emptyStateKey = GlobalKey();
  final GlobalKey _fabKey = GlobalKey();

  @override
  void initState() {
    super.initState();
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

  void _startTourOrRequestPermission() {
    if (!mounted) return;

    if (!widget.storageService.hasSeenHomeTour()) {
      _startShowcaseTour();
      widget.storageService.setSeenHomeTour();
    } else {
      _scheduleNotificationPermissionCheck(delay: const Duration(seconds: 2));
    }
  }

  void _startShowcaseTour() {
    if (!mounted) return;
    final PlantViewModel plantVm = context.read<PlantViewModel>();

    final List<GlobalKey> keys = [
      _bannerKey,
      _statsKey,
      _sectionHeaderKey,
      if (plantVm.plants.isEmpty) _emptyStateKey, // ← conditional key fix
      _fabKey,
    ];

    ShowCaseWidget.of(context).startShowCase(keys);
  }

  /// Checks notification permission and shows the dialog if not granted.
  void _scheduleNotificationPermissionCheck({Duration delay = Duration.zero}) {
    Future.delayed(delay, () {
      if (!mounted) return;
      AwesomeNotifications().isNotificationAllowed().then((bool allowed) {
        if (!allowed && mounted) {
          NotificationPermissionHandler.showPermissionDialog(context);
        }
      });
    });
  }

  @override
  void dispose() {
    _fabAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PlantViewModel plantVm = context.watch<PlantViewModel>();
    final ThemeViewModel themeVm = context.watch<ThemeViewModel>();
    final bool isDark = themeVm.isDarkMode;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final int urgent = plantVm.plants
        .where((p) => p.needsWaterNow || p.needsFoodNow)
        .length;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HomeAppBar(
        isDark: isDark,
        onToggleTheme: themeVm.toggleTheme,
        onSurface: scheme.onSurface,
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
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: _buildShowcase(
                    key: _bannerKey,
                    title: 'پەناگە سەوزەکەت 🌿',
                    description:
                        'لێرەدا کورتەیەک لە دۆخی گشتی باخچەکەت دەبینیت.',
                    isDark: isDark,
                    targetBorderRadius: BorderRadius.circular(24),
                    child: HeroBanner(urgentCount: urgent),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  child: _buildShowcase(
                    key: _statsKey,
                    title: 'ئامارە زیندوەکان 📊',
                    description:
                        'چاودێری کۆی گشتی ڕووەکەکان، ئاودان، و پێدانی کود بکە بە شێوەیەکی خێرا.',
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
                    child: UrgentBanner(urgentCount: urgent),
                  ),
                ),

              SliverToBoxAdapter(
                child: _buildShowcase(
                  key: _sectionHeaderKey,
                  title: 'ڕووەکەکانم 🪴',
                  description:
                      'لێرەوە دەتوانیت سەیری لیستی تەواوی ڕووەکە تۆمارکراوەکانت بکەیت.',
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
                  child: _buildShowcase(
                    key: _emptyStateKey,
                    title: 'باخچەکەت خاڵییە 🌱',
                    description:
                        'ئێستا هیچ ڕووەکێک لێرە نییە. یەکەم ڕووەکت زیادبکە بۆ دەستپێکردنی خشتەی چاودێری.',
                    isDark: isDark,
                    child: const EmptyPlantState(),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                  sliver: SliverList.separated(
                    itemCount: plantVm.plants.length,
                    itemBuilder: (BuildContext ctx, int i) {
                      final PlantModel p = plantVm.plants[i];
                      return PlantCard(
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
                      );
                    },
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                  ),
                ),
            ],
          ),
        ),
      ),

      floatingActionButton: _buildShowcase(
        key: _fabKey,
        title: 'زیادکردنی ڕووەک ✨',
        description:
            'لەم دوگمەیەوە دەتوانیت جۆرە جیاوازەکانی ڕووەک لای خۆت تۆمار بکەیت.',
        isDark: isDark,
        targetBorderRadius: BorderRadius.circular(28),
        child: AddPlantFAB(animation: _fabAnim, scheme: scheme),
      ),
    );
  }
}
