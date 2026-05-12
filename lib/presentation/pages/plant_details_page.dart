import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/action_bar.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/care_info_tab.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/plant_hero_card.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/schedule_tab.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/plant_details_appbar.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/details_tabbar.dart';
import 'package:mock_plant_care_app/presentation/widgets/details/delete_plant_dialog.dart';
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
      appBar: PlantDetailsAppBar(
        plant: plant,
        vm: vm,
        isDark: isDark,
        onSurface: onSurface,
        onDelete: () => _showDeleteDialog(context, plant, vm),
      ),
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
              DetailsTabBar(
                controller: _tabController,
                scheme: scheme,
                isDark: isDark,
                onSurface: onSurface,
              ),
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

  void _showDeleteDialog(
    BuildContext context,
    PlantModel plant,
    PlantViewModel vm,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => DeletePlantDialog(plant: plant, vm: vm),
    );
  }
}
