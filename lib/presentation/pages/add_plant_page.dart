import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/presentation/widgets/add/identity_section.dart';
import 'package:plant_care_app/presentation/widgets/add/schedule_section.dart';
import 'package:plant_care_app/presentation/widgets/add/reminder_section.dart';
import 'package:plant_care_app/presentation/widgets/add/add_plant_button.dart';
import 'package:plant_care_app/logic/add_plant_viewmodel.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'package:provider/provider.dart';

class AddPlantPage extends StatelessWidget {
  const AddPlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color onSurface = scheme.onSurface;

    return ChangeNotifierProvider(
      create: (ctx) => AddPlantViewModel(
        ctx.read<PlantViewModel>().storageService,
        ctx.read<PlantViewModel>().notificationService,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: onSurface),
          title: Row(
            children: [
              Image.asset('assets/icons/plant_icon.png', width: 28, height: 28),
              const SizedBox(width: 10),
              Text(
                loc.addNewPlant,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        body: _BuilderContent(
          isDark: isDark,
          scheme: scheme,
          onSurface: onSurface,
        ),
      ),
    );
  }
}

class _BuilderContent extends StatelessWidget {
  const _BuilderContent({
    required this.isDark,
    required this.scheme,
    required this.onSurface,
  });
  final bool isDark;
  final ColorScheme scheme;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPlantViewModel>(
      builder: (ctx, vm, _) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const <double>[0.0, 0.4, 1.0],
            colors: [
              scheme.primary.withValues(alpha: isDark ? 0.25 : 0.1),
              scheme.primary.withValues(alpha: isDark ? 0.08 : 0.03),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Form(
            key: vm.formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
              child: Column(
                children: [
                  PlantIdentitySection(
                    nameCtrl: vm.nameCtrl,
                    speciesCtrl: vm.speciesCtrl,
                    onSurface: onSurface,
                  ),
                  const SizedBox(height: 16),
                  CareScheduleSection(
                    waterDaysCtrl: vm.waterDaysCtrl,
                    feedDaysCtrl: vm.feedDaysCtrl,
                    onSurface: onSurface,
                  ),
                  const SizedBox(height: 16),
                  ReminderSection(
                    remindersEnabled: vm.remindersEnabled,
                    waterTime: vm.waterTime,
                    feedTime: vm.feedTime,
                    onToggleReminders: vm.toggleReminders,
                    onPickWaterTime: () => _pickTime(context, vm, true),
                    onPickFeedTime: () => _pickTime(context, vm, false),
                    onSurface: onSurface,
                  ),
                  const SizedBox(height: 28),
                  AddPlantButton(vm: vm, scheme: scheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickTime(
    BuildContext context,
    AddPlantViewModel vm,
    bool isWater,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isWater ? vm.waterTime : vm.feedTime,
    );
    if (picked != null) {
      isWater ? vm.updateWaterTime(picked) : vm.updateFeedTime(picked);
    }
  }
}
