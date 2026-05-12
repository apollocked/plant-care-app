import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/action_bar.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/care_info_tab.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/plant_hero_card.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/schedule_tab.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';
import 'package:provider/provider.dart';

class PlantDetailsPage extends StatefulWidget {
  const PlantDetailsPage({super.key, required this.plantId});
  final String plantId;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final PlantViewModel vm = context.watch<PlantViewModel>();
    final PlantModel? plant = vm.getPlantById(widget.plantId);

    if (plant == null) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.plantDetails)),
        body: Center(child: Text(loc.plantNotFound)),
      );
    }

    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color onSurface = scheme.onSurface;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, plant, vm, isDark, onSurface),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const <double>[0.0, 0.4, 1.0],
            colors: [
              scheme.primary.withValues(alpha: isDark ? 0.25 : 0.18),
              scheme.primary.withValues(alpha: isDark ? 0.08 : 0.05),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: PlantHeroCard(plant: plant),
              ),
              const SizedBox(height: 16),
              _buildTabBar(context, scheme, isDark, onSurface),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CareInfoTab(plant: plant),
                    ScheduleTab(plant: plant, vm: vm),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DetailsActionBar(
        plant: plant,
        vm: vm,
        isDark: isDark,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    PlantModel plant,
    PlantViewModel vm,
    bool isDark,
    Color onSurface,
  ) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: onSurface),
      title: Text(
        plant.name,
        style: TextStyle(
          color: onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _confirmDelete(context, plant, vm),
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.withValues(alpha: isDark ? 0.15 : 0.08),
            ),
            child: Icon(
              Icons.delete_outline_rounded,
              size: 20,
              color: Colors.red.shade400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar(
    BuildContext context,
    ColorScheme scheme,
    bool isDark,
    Color onSurface,
  ) {
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(6),
          height: 54,
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.white.withValues(alpha: 0.6),
          child: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: <Color>[
                  scheme.primary,
                  Color.lerp(scheme.primary, Colors.teal, 0.45)!,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: scheme.primary.withValues(alpha: 0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            labelColor: Colors.white,
            unselectedLabelColor: onSurface.withValues(alpha: 0.45),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            tabs: [
              Tab(text: loc.tabCareInfo),
              Tab(text: loc.tabSchedule),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    PlantModel plant,
    PlantViewModel vm,
  ) {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          loc.removePlant,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text(loc.removePlantConfirm(plant.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              Navigator.pop(ctx);
              await vm.deletePlant(plant.id);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(loc.remove),
          ),
        ],
      ),
    );
  }
}
