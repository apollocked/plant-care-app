import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/core/theme/app_colors.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';

class DeletePlantDialog extends StatelessWidget {
  const DeletePlantDialog({super.key, required this.plant, required this.vm});
  final PlantModel plant;

  final PlantViewModel vm;

  void _performDelete(BuildContext context) async {
    await vm.deletePlant(plant.id);

    if (context.mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        loc.removePlant,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(loc.removePlantConfirm(plant.name)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(loc.cancel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
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
