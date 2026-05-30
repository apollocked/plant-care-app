// ignore_for_file: use_build_context_synchronously

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/logic/add_plant_viewmodel.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';
import 'package:mock_plant_care_app/presentation/widgets/permission/notfication_handler.dart';
import 'package:provider/provider.dart';

class AddPlantButton extends StatefulWidget {
  const AddPlantButton({super.key, required this.vm, required this.scheme});
  final AddPlantViewModel vm;
  final ColorScheme scheme;

  @override
  State<AddPlantButton> createState() => _AddPlantButtonState();
}

class _AddPlantButtonState extends State<AddPlantButton> {
  bool _isSaving = false;

  Future<void> _savePlant(BuildContext context) async {
    if (!widget.vm.formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      final plant = await widget.vm.createPlant();
      if (mounted) {
        final PlantViewModel plantVm = context.read<PlantViewModel>();
        final bool isFirstPlant = plantVm.plants.isEmpty;
        await plantVm.addPlant(plant, context);
        final NavigatorState nav = Navigator.of(context);
        nav.pop();
        if (isFirstPlant && mounted) {
          final bool allowed = await AwesomeNotifications().isNotificationAllowed();
          if (!allowed && nav.context.mounted) {
            NotificationPermissionHandler.showPermissionDialog(nav.context);
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.failedToSavePlant(e.toString()),
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: _isSaving ? null : () => _savePlant(context),
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              widget.scheme.primary,
              Color.lerp(widget.scheme.primary, Colors.teal, 0.45)!,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: widget.scheme.primary.withValues(alpha: 0.4),
              blurRadius: 18,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Center(
          child: _isSaving
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.local_florist_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      loc.savePlant,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
