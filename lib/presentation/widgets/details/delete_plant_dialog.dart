import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/data/services/notification_service.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';
import 'package:mock_plant_care_app/logic/widget_manager_viewmodel.dart';

class DeletePlantDialog extends StatelessWidget {
  const DeletePlantDialog({super.key, required this.plant, required this.vm});
  final PlantModel plant;

  final PlantViewModel vm;

  void _performDelete(BuildContext context) async {
    final NotificationService notificationService = NotificationService();
    Navigator.pop(context);
    await vm.deletePlant(plant.id);

    await WidgetManager.updateHomeScreenWidget(vm.plants);
    notificationService.cancelPlantReminders(plant.id);
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        loc.removePlant,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      content: Text(loc.removePlantConfirm(plant.name)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
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
          onPressed: () => _performDelete(context),
          child: Text(loc.remove),
        ),
      ],
    );
  }
}
