import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/data/services/widget_installer_service.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'package:plant_care_app/logic/widget_manager_viewmodel.dart';
import 'glass_container.dart';
import 'settings_section_header.dart';
import 'package:provider/provider.dart';

class WidgetCreationSection extends StatelessWidget {
  const WidgetCreationSection({super.key, required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsSectionHeader(
          label: loc.settingsWidget,
          icon: Icons.widgets_outlined,
          scheme: scheme,
        ),
        const SizedBox(height: 10),
        GlassContainer(
          borderRadius: 16,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.createWidget,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: scheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      loc.settingsWidgetDesc,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: scheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  final plantVm = context.read<PlantViewModel>();
                  final successMsg = loc.widgetCreatedSuccess;
                  final scaffold = ScaffoldMessenger.of(context);

                  // Step 1: Render widget
                  final success = await WidgetManager.updateHomeScreenWidget(
                    plantVm.plants,
                  );

                  if (success) {
                    // Step 2: Add to home screen automatically
                    await WidgetInstallerService.addWidgetToHomeScreen();

                    scaffold.showSnackBar(
                      SnackBar(
                        content: Text(successMsg),
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.green.shade400,
                      ),
                    );
                  } else {
                    if (context.mounted) {
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Widget creation failed. Try again!',
                          ),
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.red.shade400,
                        ),
                      );
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
